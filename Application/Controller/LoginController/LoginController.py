# IMPORT FIX
import os, sys, inspect
current_dir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
controller_dir = os.path.dirname(current_dir)
application_dir = os.path.dirname(controller_dir)
main_dir = os.path.dirname(application_dir)
sys.path.insert(0, main_dir) 

# Necessary imports
from Application.Model.DatabaseConnection.Database import Database 
from Application.Views.LoginView.login import Ui_MainWindow

from PyQt5 import QtCore, QtGui, QtWidgets

class LogInController:

    def __init__(self):
        '''
        CONSTRUCTOR METHOD
        '''
        # Sets database and view
        self.model = Database('ge/ge@//localhost:1521/JUDICIALRECORDSYSTEM')
        self.view = Ui_MainWindow()

        # Loads application
        app = QtWidgets.QApplication(sys.argv)
        MainWindow = QtWidgets.QMainWindow()
        self.view.setupUi(MainWindow)

        # Gets the information passed


        # Sets event
        self.view.LoginButton_Login.clicked.connect(self.btn_clicked)
        

        self.loadUi(MainWindow, app)

       

    def loadUi(self, pMainWindow, pApp):
        '''
        Renders the application for the user
        '''
        pMainWindow.show()
        sys.exit(pApp.exec_())


    def btn_clicked(self):
        print('clicked!')