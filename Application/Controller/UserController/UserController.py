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
        
        # LOADS INFORMATION
        self.add_circuits(self.view.JudicialCircuitChoice_RecordRegister)
        self.get_recordless_lawsuits()

        # Sets events
        self.view.JudicialCircuitChoice_RecordRegister.currentIndexChanged.connect(lambda: self.selected_circuit(
            self.view.JudicialCircuitChoice_RecordRegister,
            self.view.OfficeChoice_RecordRegister    
        ))

        self.view.OfficeChoice_RecordRegister.currentIndexChanged.connect(lambda: self.selected_office(
            self.view.OfficeChoice_RecordRegister,
            self.view.OfficeInput_RecordRegister,
            self.view.SubjectInput_RecordRegister
        ))

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
        pass
