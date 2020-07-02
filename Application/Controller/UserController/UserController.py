# IMPORT FIX
import os, sys, inspect
current_dir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
controller_dir = os.path.dirname(current_dir)
application_dir = os.path.dirname(controller_dir)
main_dir = os.path.dirname(application_dir)
sys.path.insert(0, main_dir) 

# Necessary imports
from Application.Model.DatabaseConnection.Database import Database 
from Application.Views.UserView.Home import Ui_UserHome
import Application.Model.DatabaseConnection.Instructions as I

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox

class UserController:

    def __init__(self, pMainWindow, pApp):
        self.model = Database.getInstance()
        self.view = Ui_UserHome()

        # Loads application
        app = pApp
        MainWindow = pMainWindow
        self.view.setupUi(MainWindow)
        self.disableFilters()
        # LOADS INFORMATION
        # ------------ REGISTER RECORDS
        self.add_circuits(self.view.JudicialCircuitChoice_RecordRegister)
        self.get_recordless_lawsuits()
        
        # ------------- GENERAL QUERIES
        self.add_queries(self.view.QueryChoice_GeneralQueries)

        # Sets events
        # ------------ REGISTER RECORDS
        self.view.JudicialCircuitChoice_RecordRegister.currentIndexChanged.connect(lambda: self.selected_circuit(
            self.view.JudicialCircuitChoice_RecordRegister,
            self.view.OfficeChoice_RecordRegister    
        ))

        self.view.OfficeChoice_RecordRegister.currentIndexChanged.connect(lambda: self.selected_office(
            self.view.OfficeChoice_RecordRegister,
            self.view.OfficeInput_RecordRegister,
            self.view.SubjectInput_RecordRegister
        ))

        self.view.ApplyButton_RecordRegister.clicked.connect(lambda: self.insertRecord())

        # ----------- GENERAL QUERIES
        self.view.QueryChoice_GeneralQueries.currentIndexChanged.connect(lambda: self.select_query())
        self.view.GeneralQueryApplyButton_GeneralQueries.clicked.connect(lambda: self.applyQuery())

        # LABELS
        username = self.model.getUser().user
        self.view.UsernameLabel_Home.setText(username)
        self.view.UsernameLabel_RecordRegister.setText(username)
        self.view.UsernameLabel_RecordLookUp.setText(username)
        self.view.UsernameLabel_PersonRegister.setText(username)
        self.view.UsernameLabel_GeneralQueries.setText(username)
        self.view.UsernameLabel_Lawsuit.setText(username)

        # RENDERS WINDOW
        MainWindow.show()


    def add_circuits(self, pBox):
        '''
        Adds all circuits to a combo box
        '''
        circuits = self.model.userQuery(I.PROCEDURE, I.GET_CIRCUITS, getRows=True)

        for circuit in circuits:
            name = str(circuit[0]) + "-" + circuit[1]
            pBox.addItem(name)


    def selected_circuit(self, pBox1, pBox2):
        '''
        UPDATES THE OFFICES
        '''
        pBox2.setCurrentIndex(0)
        pBox2.clear()
        text = str(pBox1.currentText())
        id = text.split('-')

        # QUERIES THE OFFICES DEPENDING ON THE NAME OF THE CIRCUIT
        offices = self.model.userQuery(I.PROCEDURE, I.GET_OFFICE, parameters=[int(id[0])], getRows=True)
    
        for office in offices:
            pBox2.addItem(str(office[0]) + "-|" + office[1] + "-|" + office[2])


    def selected_office(self, pBox, pOfficeId, pOfficeSubject):
        text = str(pBox.currentText())
        info = text.split('-|')

        if len(info) < 3:
            return

        pOfficeId.setText(info[0])
        pOfficeSubject.setText(info[2])


    def get_recordless_lawsuits(self):
        # QUERIES THE LAWSUITS WITHOUT RECORD
        data = [self.model.getUser().id]
        lawsuits = self.model.userQuery(I.PROCEDURE, I.GET_RECORDLESS_LAWSUITS, parameters=data, getRows=True)

        for lawsuit in lawsuits:
            self.view.PersonID_RecordRegister.addItem(str(lawsuit[0]) + '-' + lawsuit[1])


    def insertRecord(self):
        '''
        INSERTS THE RECORD INTO THE DB
        '''
        year = self.view.YearInput_RecordRegister.text()
        consec = self.view.ConsecutiveInput_RecordRegister.text()  
        officeId = self.view.OfficeInput_RecordRegister.text()
        subject = self.view.SubjectInput_RecordRegister.text()

        if (not year) or (not consec) or (not officeId) or (not subject):
            self.show_error('INVALID INPUTS', 'Please enter valid data.')
            return

        try:
            year = int(year)
            consec = int(consec)
            officeId = int(officeId)

            text = self.view.PersonID_RecordRegister.currentText()
            info = text.split('-')

            username = self.model.getUser().user
            
            prosecutorId = self.model.userQuery(I.FUNCTION, I.GET_PERSON_FROM_ACCOUNT, parameters=[username], returnType=int)
            defendantId = int(info[0])
            data = [defendantId, prosecutorId, info[1]]

            sueId = self.model.userQuery(I.FUNCTION, I.GET_LAWSUIT_ID, parameters=data, returnType=int)

            self.model.insertRecord()

        except:
            self.show_error('INVALID INPUT', 'Fix your data to insert the record.')        


    def show_error(self, pTitle, pMessage):
        '''
        Shows a pop up error in case the connection is invalid
        '''
        msg = QMessageBox()
        msg.setWindowTitle(pTitle)
        msg.setText(pMessage)

        msg.setIcon(QMessageBox.Critical)
        msg.setStandardButtons(QMessageBox.Retry)

        msg.exec_()

    def add_queries(self, pBox):
        pBox.addItems(['ALL USERS',
                      'BANNED USERS',
                      'COMMITTED CRIMES',
                      'DANGEROUS ZONES',
                      'LONGEST SENTENCES',
                      'MOST CRIMES',
                      'SOON TO EXPIRE'])
    
    def disableFilters(self):
        filters = [
            self.view.RecordTypeFilter_GeneralQueries,
            self.view.DistrictFilter_GeneralQueries,
            self.view.CommunityFilter_GeneralQueries,
            self.view.ProvinceFilter_GeneralQueries,
            self.view.CantonFilter_GeneralQueries,
            self.view.NValueFilter_GeneralQueries,
            self.view.InitialDateFilter_GeneralQueries,
            self.view.FinalDateFilter_GeneralQueries
        ]

        # DISABLES ALL WIDGETS
        for filter in filters:
            filter.setEnabled(False)

    def select_query(self):
        '''
        ENABLES OR DISABLES THE FILTERS BASED ON THE SELECTED QUERY
        '''
        self.disableFilters()

        # DISABLES CORRESPONDING WIDGETS
        widgetByQuery = {
            'ALL USERS' : [], # EMPTY
            'BANNED USERS' : [], # EMPTY
            'COMMITTED CRIMES' : [self.view.NValueFilter_GeneralQueries], # PERSON SPECIFIC
            'DANGEROUS ZONES' : [], # EMPTY
            'LONGEST SENTENCES' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries], # DATE FILTERED
            'MOST CRIMES' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries], # DATE FILTERED
            'SOON TO EXPIRE' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries] # DATE FILTERED
        }

        option = self.view.QueryChoice_GeneralQueries.currentText()
        
        query = widgetByQuery[option]
        
        for filter in query:
            filter.setEnabled(True)

    def applyQuery(self):
        '''
        APPLIES THE QUERY AND SHOWS THE RESULT
        '''
        self.view.GeneralQueryDisplay_GeneralQueries.clear()

        InstructionByQuery = {
            'ALL USERS' : I.GET_ALL_USERS, # EMPTY
            'BANNED USERS' : I.GET_BANNED_USERS, # EMPTY
            'COMMITTED CRIMES' : I.GET_COMMITED_CRIMES, # PERSON SPECIFIC
            'DANGEROUS ZONES' : I.GET_DANGEROUS_ZONES, # EMPTY
            'LONGEST SENTENCES' : I.GET_LONGEST_SENTENCES, # DATE FILTERED
            'MOST CRIMES' : I.GET_MOST_CRIMES, # DATE FILTERED
            'SOON TO EXPIRE' : I.GET_SOON_TO_EXPIRE  # DATE FILTERED
        }
        
        query = self.view.QueryChoice_GeneralQueries.currentText()
        instruction = InstructionByQuery[query]
        data = []

        if query == 'LONGEST SENTENCES' or query == 'MOST CRIMES' or query == 'SOON TO EXPIRE':
            data.append(self.view.InitialDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[0:5] +
                        self.view.InitialDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[8:13])
            data.append(self.view.FinalDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[0:5] +
                        self.view.FinalDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[8:13]) 
            
            if self.view.InitialDateFilter_GeneralQueries.date().toPyDate() > self.view.FinalDateFilter_GeneralQueries.date().toPyDate():
                self.show_error('INVALID DATES', 'Select valid dates.')


        elif query == 'COMMITTED CRIMES':
            data.append(self.view.NValueFilter_GeneralQueries.text())

        try: 
            result = self.model.userQuery(I.PROCEDURE, instruction, parameters=data, getRows=True)
            
            header = ''
            # PRINTS COLUMN NAMES
            for column in result.description:
                header += "    |   " + str(column[0])

            self.view.GeneralQueryDisplay_GeneralQueries.addItem(header)
            self.view.GeneralQueryDisplay_GeneralQueries.addItem('-'*1000)
            # PRINTS VALUES
            for row in result:
                string = ''
                for data in row:
                    string += "    |   " + str(data)

                self.view.GeneralQueryDisplay_GeneralQueries.addItem(string)
        except:
            return