# IMPORT FIX
import os, sys, inspect
current_dir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
controller_dir = os.path.dirname(current_dir)
application_dir = os.path.dirname(controller_dir)
main_dir = os.path.dirname(application_dir)
sys.path.insert(0, main_dir) 

# Necessary imports
from Application.Model.DatabaseConnection.Database import Database 
from Application.Views.AdminView.Home import Ui_MainMenu
import Application.Model.DatabaseConnection.Instructions as I

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox

class AdminController:

    def __init__(self, pMainWindow, pApp):
        self.model = Database.getInstance()
        self.view = Ui_MainMenu()

        # Loads application
        app = pApp
        MainWindow = pMainWindow
        self.view.setupUi(MainWindow)

        # LOAD INFORMATION
        self.add_queries(self.view.QueryChoice_GeneralQueries)
        self.disableFilters()

        # ----------- GENERAL QUERIES
        self.view.QueryChoice_GeneralQueries.currentIndexChanged.connect(lambda: self.select_query())
        self.view.GenQueryApply_Statistics__GeneralQueries.clicked.connect(lambda: self.applyQuery())

        # LABELS
        username = self.model.getUser().user
        self.view.UsernameLabel_Home.setText(username)
        self.view.UsernameLabel_Data.setText(username)
        self.view.UsernameLabel_BanUser.setText(username)
        self.view.UsernameLabel_PersonRegister.setText(username)
        self.view.UsernameLabel_AuditLogs.setText(username)
        self.view.UsernameLabel_Catalogs.setText(username)
        self.view.UsernameLabel_Records.setText(username)
        self.view.UsernameLabel_Statistics.setText(username)
        self.view.UsernameLabel_GeneralQueries.setText(username)
        self.view.UsernameLabel_Resolution.setText(username)
        self.view.UsernameLabel_RecordRegister.setText(username)


        # RENDERS WINDOW
        MainWindow.show()


    def add_queries(self, pBox):
        pBox.addItems(['ALL USERS',
                      'BANNED USERS',
                      'COMMITTED CRIMES',
                      'DANGEROUS ZONES',
                      'LONGEST SENTENCES',
                      'MOST CRIMES',
                      'SOON TO EXPIRE',
                      'AVERAGE RESOLUTION TIME',
                      'USERS WITH PASSWORD MODIFIED',
                      'NEW RECORDS',
                      'USERS WITH UNMODIFIED PASSWORDS',
                      'UNRESOLVED RECORDS'])


    def disableFilters(self):
        filters = [
            self.view.RecordTypeFilter_GeneralQueries,
            self.view.DistrictFilter_GeneralQueries,
            self.view.CommunityFilter_GeneralQueries,
            self.view.ProvinceFilter_GeneralQueries,
            self.view.CantonFilter_GeneralQueries,
            self.view.NValuesFilter_GeneralQueries,
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
            'COMMITTED CRIMES' : [self.view.NValuesFilter_GeneralQueries], # PERSON SPECIFIC
            'DANGEROUS ZONES' : [], # EMPTY
            'LONGEST SENTENCES' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries], # DATE FILTERED
            'MOST CRIMES' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries], # DATE FILTERED
            'SOON TO EXPIRE' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries], # DATE FILTERED
            'AVERAGE RESOLUTION TIME' : [], # EMPTY
            'USERS WITH PASSWORD MODIFIED' : [self.view.InitialDateFilter_GeneralQueries, self.view.FinalDateFilter_GeneralQueries], # DATE FILTERED
            'NEW RECORDS' : [], # EMPTY
            'USERS WITH UNMODIFIED PASSWORDS' : [], # EMPTY
            'UNRESOLVED RECORDS' : [] # EMPTY
        }

        option = self.view.QueryChoice_GeneralQueries.currentText()
        
        query = widgetByQuery[option]
        
        for filter in query:
            filter.setEnabled(True)


    def applyQuery(self):
        '''
        APPLIES THE QUERY AND SHOWS THE RESULT
        '''
        self.view.GeneralQueryDisplay__GeneralQueries.clear()

        InstructionByQuery = {
            'ALL USERS' : I.GET_ALL_USERS, # EMPTY
            'BANNED USERS' : I.GET_BANNED_USERS, # EMPTY
            'COMMITTED CRIMES' : I.GET_COMMITED_CRIMES, # PERSON SPECIFIC
            'DANGEROUS ZONES' : I.GET_DANGEROUS_ZONES, # EMPTY
            'LONGEST SENTENCES' : I.GET_LONGEST_SENTENCES, # DATE FILTERED
            'MOST CRIMES' : I.GET_MOST_CRIMES, # DATE FILTERED
            'SOON TO EXPIRE' : I.GET_SOON_TO_EXPIRE,  # DATE FILTERED
            'AVERAGE RESOLUTION TIME' : I.GET_AVERAGE_RECORDS, # EMPTY
            'USERS WITH PASSWORD MODIFIED' : I.GET_MODIFIED_USERS, # DATE FILTERED
            'NEW RECORDS' : I.GET_NEW_RECORDS, # EMPTY
            'USERS WITH UNMODIFIED PASSWORDS' : I.GET_UNMODIFIED_USERS, # EMPTY
            'UNRESOLVED RECORDS' : I.GET_UNRESOLVED_RECORDS 
        }
        
        query = self.view.QueryChoice_GeneralQueries.currentText()
        instruction = InstructionByQuery[query]
        data = []

        if query == 'LONGEST SENTENCES' or query == 'MOST CRIMES' or query == 'SOON TO EXPIRE' or query == 'USERS WITH PASSWORD MODIFIED':
            data.append(self.view.InitialDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[0:5] +
                        self.view.InitialDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[8:13])
            data.append(self.view.FinalDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[0:5] +
                        self.view.FinalDateFilter_GeneralQueries.date().toPyDate().strftime('%Y/%M/%D')[8:13]) 
            
            if self.view.InitialDateFilter_GeneralQueries.date().toPyDate() > self.view.FinalDateFilter_GeneralQueries.date().toPyDate():
                self.show_error('INVALID DATES', 'Select valid dates.')


        elif query == 'COMMITTED CRIMES':
            data.append(self.view.NValuesFilter_GeneralQueries.text())

        if query != 'AVERAGE RESOLUTION TIME':

            try: 
                result = self.model.adminQuery(I.PROCEDURE, instruction, parameters=data, getRows=True)

                header = ''
                # PRINTS COLUMN NAMES
                for column in result.description:
                    header += "    |   " + str(column[0])

                self.view.GeneralQueryDisplay__GeneralQueries.addItem(header)
                self.view.GeneralQueryDisplay__GeneralQueries.addItem('-'*1000)
                # PRINTS VALUES
                for row in result:
                    string = ''
                    for data in row:
                        string += "    |   " + str(data)

                    self.view.GeneralQueryDisplay__GeneralQueries.addItem(string)
            except:
                return

        else:
            result = self.model.adminQuery(I.FUNCTION, instruction, parameters=data, returnType=float)
            print(result)
            self.view.GeneralQueryDisplay__GeneralQueries.addItem(str(result))


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