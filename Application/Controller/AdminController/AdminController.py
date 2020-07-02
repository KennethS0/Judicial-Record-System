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

        # Sets events

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
