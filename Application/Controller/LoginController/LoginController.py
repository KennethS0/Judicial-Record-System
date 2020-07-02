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
from Application.Controller.AdminController.AdminController import AdminController 
from Application.Controller.UserController.UserController import UserController

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox

class LogInController:

    GENERAL_CONNECTION = 'ge/ge@//localhost:1521/JUDICIALRECORDSYSTEM'

    def __init__(self):
        '''
        CONSTRUCTOR METHOD
        '''
        # Sets database and view
        self.model = Database.getInstance()
        self.view = Ui_MainWindow()

        # Loads application
        app = QtWidgets.QApplication(sys.argv)
        MainWindow = QtWidgets.QMainWindow()
        self.view.setupUi(MainWindow)

        # Sets event
        self.view.LoginButton_Login.clicked.connect(lambda: self.login_clicked(MainWindow, app))

        self.loadUi(MainWindow, app)

       
    def loadUi(self, pMainWindow, pApp):
        '''
        Renders the application for the user
        '''
        pMainWindow.show()
        sys.exit(pApp.exec_())
        sys.exit(self.Model.disconnect())


    def login_clicked(self, pMainWindow, pApp):
        '''
        Event for log in
        '''
        username = self.view.UserName_Login.text()
        password = self.view.Password_Login.text()

        try:
            # Connects to the database to log the user
            self.model.connect(self.GENERAL_CONNECTION)
            self.model.logUser(username, password)

            # Invokes the new window
            if self.model.getUser().isAdmin == True:
                ac = AdminController(pMainWindow, pApp)
            else:
                uc = UserController(pMainWindow, pApp)

        except Exception as err:
            print(err)
            self.view.UserName_Login.setText('')
            self.view.Password_Login.setText('')
            self.show_error('Invalid Credentials', 'Please enter a valid username or password.')


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
