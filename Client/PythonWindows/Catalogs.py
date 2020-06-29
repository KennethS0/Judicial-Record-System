# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Catalogs.ui'
#
# Created by: PyQt5 UI code generator 5.15.0
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Catalogs(object):
    def setupUi(self, Catalogs):
        Catalogs.setObjectName("Catalogs")
        Catalogs.resize(1494, 845)
        self.centralwidget = QtWidgets.QWidget(Catalogs)
        self.centralwidget.setObjectName("centralwidget")
        self.BackgroundFrame = QtWidgets.QFrame(self.centralwidget)
        self.BackgroundFrame.setGeometry(QtCore.QRect(0, 0, 1531, 811))
        self.BackgroundFrame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.BackgroundFrame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.BackgroundFrame.setObjectName("BackgroundFrame")
        self.BackgrounLabel = QtWidgets.QLabel(self.BackgroundFrame)
        self.BackgrounLabel.setGeometry(QtCore.QRect(0, 0, 1491, 811))
        self.BackgrounLabel.setText("")
        self.BackgrounLabel.setPixmap(QtGui.QPixmap("Images/Catalogs.png"))
        self.BackgrounLabel.setScaledContents(True)
        self.BackgrounLabel.setObjectName("BackgrounLabel")
        self.DataButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.DataButton.setGeometry(QtCore.QRect(0, 110, 241, 51))
        self.DataButton.setText("")
        self.DataButton.setFlat(True)
        self.DataButton.setObjectName("DataButton")
        self.RecordsButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.RecordsButton.setGeometry(QtCore.QRect(0, 380, 241, 51))
        self.RecordsButton.setText("")
        self.RecordsButton.setFlat(True)
        self.RecordsButton.setObjectName("RecordsButton")
        self.StatisticsButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.StatisticsButton.setGeometry(QtCore.QRect(0, 440, 241, 51))
        self.StatisticsButton.setText("")
        self.StatisticsButton.setFlat(True)
        self.StatisticsButton.setObjectName("StatisticsButton")
        self.LogOutButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.LogOutButton.setGeometry(QtCore.QRect(0, 750, 241, 51))
        self.LogOutButton.setText("")
        self.LogOutButton.setFlat(True)
        self.LogOutButton.setObjectName("LogOutButton")
        self.UsernameLabel = QtWidgets.QLabel(self.BackgroundFrame)
        self.UsernameLabel.setGeometry(QtCore.QRect(1363, 18, 81, 21))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(14)
        self.UsernameLabel.setFont(font)
        self.UsernameLabel.setCursor(QtGui.QCursor(QtCore.Qt.BlankCursor))
        self.UsernameLabel.setAutoFillBackground(False)
        self.UsernameLabel.setStyleSheet("color: rgb(234, 234, 234);")
        self.UsernameLabel.setObjectName("UsernameLabel")
        self.HomeButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.HomeButton.setGeometry(QtCore.QRect(0, 60, 241, 51))
        self.HomeButton.setText("")
        self.HomeButton.setFlat(True)
        self.HomeButton.setObjectName("HomeButton")
        self.AuditLogButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.AuditLogButton.setGeometry(QtCore.QRect(0, 270, 241, 51))
        self.AuditLogButton.setText("")
        self.AuditLogButton.setFlat(True)
        self.AuditLogButton.setObjectName("AuditLogButton")
        self.CatalogButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.CatalogButton.setGeometry(QtCore.QRect(0, 330, 241, 51))
        self.CatalogButton.setText("")
        self.CatalogButton.setFlat(True)
        self.CatalogButton.setObjectName("CatalogButton")
        self.SubmitButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.SubmitButton.setGeometry(QtCore.QRect(1254, 678, 127, 33))
        self.SubmitButton.setText("")
        self.SubmitButton.setFlat(True)
        self.SubmitButton.setObjectName("SubmitButton")
        self.UserBanButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.UserBanButton.setGeometry(QtCore.QRect(0, 170, 241, 51))
        self.UserBanButton.setText("")
        self.UserBanButton.setFlat(True)
        self.UserBanButton.setObjectName("UserBanButton")
        self.PersonRegisterbutton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.PersonRegisterbutton.setGeometry(QtCore.QRect(0, 220, 241, 51))
        self.PersonRegisterbutton.setText("")
        self.PersonRegisterbutton.setFlat(True)
        self.PersonRegisterbutton.setObjectName("PersonRegisterbutton")
        self.NameInput = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.NameInput.setEnabled(True)
        self.NameInput.setGeometry(QtCore.QRect(392, 158, 137, 20))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.NameInput.setFont(font)
        self.NameInput.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.NameInput.setAcceptDrops(True)
        self.NameInput.setAutoFillBackground(False)
        self.NameInput.setFrame(False)
        self.NameInput.setClearButtonEnabled(False)
        self.NameInput.setObjectName("NameInput")
        self.FirstLastNameInput = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.FirstLastNameInput.setEnabled(True)
        self.FirstLastNameInput.setGeometry(QtCore.QRect(393, 197, 137, 20))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.FirstLastNameInput.setFont(font)
        self.FirstLastNameInput.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.FirstLastNameInput.setAcceptDrops(True)
        self.FirstLastNameInput.setAutoFillBackground(False)
        self.FirstLastNameInput.setFrame(False)
        self.FirstLastNameInput.setClearButtonEnabled(False)
        self.FirstLastNameInput.setObjectName("FirstLastNameInput")
        self.UsernameInput = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.UsernameInput.setEnabled(True)
        self.UsernameInput.setGeometry(QtCore.QRect(640, 160, 137, 20))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.UsernameInput.setFont(font)
        self.UsernameInput.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.UsernameInput.setAcceptDrops(True)
        self.UsernameInput.setAutoFillBackground(False)
        self.UsernameInput.setFrame(False)
        self.UsernameInput.setClearButtonEnabled(False)
        self.UsernameInput.setObjectName("UsernameInput")
        self.SeconLastNameInput = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.SeconLastNameInput.setEnabled(True)
        self.SeconLastNameInput.setGeometry(QtCore.QRect(393, 233, 137, 20))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.SeconLastNameInput.setFont(font)
        self.SeconLastNameInput.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.SeconLastNameInput.setAcceptDrops(True)
        self.SeconLastNameInput.setAutoFillBackground(False)
        self.SeconLastNameInput.setFrame(False)
        self.SeconLastNameInput.setClearButtonEnabled(False)
        self.SeconLastNameInput.setObjectName("SeconLastNameInput")
        self.FirstSpaceID = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.FirstSpaceID.setEnabled(True)
        self.FirstSpaceID.setGeometry(QtCore.QRect(392, 270, 41, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.FirstSpaceID.setFont(font)
        self.FirstSpaceID.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.FirstSpaceID.setAcceptDrops(True)
        self.FirstSpaceID.setAutoFillBackground(False)
        self.FirstSpaceID.setFrame(False)
        self.FirstSpaceID.setClearButtonEnabled(False)
        self.FirstSpaceID.setObjectName("FirstSpaceID")
        self.ThirdSpaceID = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.ThirdSpaceID.setEnabled(True)
        self.ThirdSpaceID.setGeometry(QtCore.QRect(584, 270, 103, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.ThirdSpaceID.setFont(font)
        self.ThirdSpaceID.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.ThirdSpaceID.setAcceptDrops(True)
        self.ThirdSpaceID.setAutoFillBackground(False)
        self.ThirdSpaceID.setFrame(False)
        self.ThirdSpaceID.setClearButtonEnabled(False)
        self.ThirdSpaceID.setObjectName("ThirdSpaceID")
        self.SecondSpaceID = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.SecondSpaceID.setEnabled(True)
        self.SecondSpaceID.setGeometry(QtCore.QRect(457, 270, 103, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.SecondSpaceID.setFont(font)
        self.SecondSpaceID.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.SecondSpaceID.setAcceptDrops(True)
        self.SecondSpaceID.setAutoFillBackground(False)
        self.SecondSpaceID.setFrame(False)
        self.SecondSpaceID.setClearButtonEnabled(False)
        self.SecondSpaceID.setObjectName("SecondSpaceID")
        self.UserSamePassDisplay = QtWidgets.QLabel(self.BackgroundFrame)
        self.UserSamePassDisplay.setGeometry(QtCore.QRect(395, 323, 381, 121))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.UserSamePassDisplay.setFont(font)
        self.UserSamePassDisplay.setAutoFillBackground(False)
        self.UserSamePassDisplay.setText("")
        self.UserSamePassDisplay.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignTop)
        self.UserSamePassDisplay.setObjectName("UserSamePassDisplay")
        self.UserSamePassDisplay_2 = QtWidgets.QLabel(self.BackgroundFrame)
        self.UserSamePassDisplay_2.setGeometry(QtCore.QRect(395, 495, 381, 121))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.UserSamePassDisplay_2.setFont(font)
        self.UserSamePassDisplay_2.setAutoFillBackground(False)
        self.UserSamePassDisplay_2.setText("")
        self.UserSamePassDisplay_2.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignTop)
        self.UserSamePassDisplay_2.setObjectName("UserSamePassDisplay_2")
        self.RecordsWithoutResDisplay = QtWidgets.QLabel(self.BackgroundFrame)
        self.RecordsWithoutResDisplay.setGeometry(QtCore.QRect(877, 323, 381, 121))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.RecordsWithoutResDisplay.setFont(font)
        self.RecordsWithoutResDisplay.setAutoFillBackground(False)
        self.RecordsWithoutResDisplay.setText("")
        self.RecordsWithoutResDisplay.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignTop)
        self.RecordsWithoutResDisplay.setObjectName("RecordsWithoutResDisplay")
        self.AverageResolutionDisplay = QtWidgets.QLabel(self.BackgroundFrame)
        self.AverageResolutionDisplay.setGeometry(QtCore.QRect(877, 203, 381, 28))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.AverageResolutionDisplay.setFont(font)
        self.AverageResolutionDisplay.setAutoFillBackground(False)
        self.AverageResolutionDisplay.setText("")
        self.AverageResolutionDisplay.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignTop)
        self.AverageResolutionDisplay.setObjectName("AverageResolutionDisplay")
        self.RecWithoutResInitialDate = QtWidgets.QDateEdit(self.BackgroundFrame)
        self.RecWithoutResInitialDate.setGeometry(QtCore.QRect(950, 274, 111, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.RecWithoutResInitialDate.setFont(font)
        self.RecWithoutResInitialDate.setAcceptDrops(False)
        self.RecWithoutResInitialDate.setAutoFillBackground(False)
        self.RecWithoutResInitialDate.setWrapping(False)
        self.RecWithoutResInitialDate.setFrame(False)
        self.RecWithoutResInitialDate.setButtonSymbols(QtWidgets.QAbstractSpinBox.UpDownArrows)
        self.RecWithoutResInitialDate.setProperty("showGroupSeparator", False)
        self.RecWithoutResInitialDate.setCalendarPopup(True)
        self.RecWithoutResInitialDate.setObjectName("RecWithoutResInitialDate")
        self.RecWithoutResFinalDate = QtWidgets.QDateEdit(self.BackgroundFrame)
        self.RecWithoutResFinalDate.setGeometry(QtCore.QRect(1140, 272, 111, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.RecWithoutResFinalDate.setFont(font)
        self.RecWithoutResFinalDate.setAcceptDrops(False)
        self.RecWithoutResFinalDate.setAutoFillBackground(False)
        self.RecWithoutResFinalDate.setWrapping(False)
        self.RecWithoutResFinalDate.setFrame(False)
        self.RecWithoutResFinalDate.setButtonSymbols(QtWidgets.QAbstractSpinBox.UpDownArrows)
        self.RecWithoutResFinalDate.setProperty("showGroupSeparator", False)
        self.RecWithoutResFinalDate.setCalendarPopup(True)
        self.RecWithoutResFinalDate.setObjectName("RecWithoutResFinalDate")
        self.AverageResInitialDate = QtWidgets.QDateEdit(self.BackgroundFrame)
        self.AverageResInitialDate.setGeometry(QtCore.QRect(950, 158, 111, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.AverageResInitialDate.setFont(font)
        self.AverageResInitialDate.setAcceptDrops(False)
        self.AverageResInitialDate.setAutoFillBackground(False)
        self.AverageResInitialDate.setWrapping(False)
        self.AverageResInitialDate.setFrame(False)
        self.AverageResInitialDate.setButtonSymbols(QtWidgets.QAbstractSpinBox.UpDownArrows)
        self.AverageResInitialDate.setProperty("showGroupSeparator", False)
        self.AverageResInitialDate.setCalendarPopup(True)
        self.AverageResInitialDate.setObjectName("AverageResInitialDate")
        self.AverageResFinalDate = QtWidgets.QDateEdit(self.BackgroundFrame)
        self.AverageResFinalDate.setGeometry(QtCore.QRect(1140, 158, 111, 31))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.AverageResFinalDate.setFont(font)
        self.AverageResFinalDate.setAcceptDrops(False)
        self.AverageResFinalDate.setAutoFillBackground(False)
        self.AverageResFinalDate.setWrapping(False)
        self.AverageResFinalDate.setFrame(False)
        self.AverageResFinalDate.setButtonSymbols(QtWidgets.QAbstractSpinBox.UpDownArrows)
        self.AverageResFinalDate.setProperty("showGroupSeparator", False)
        self.AverageResFinalDate.setCalendarPopup(True)
        self.AverageResFinalDate.setObjectName("AverageResFinalDate")
        Catalogs.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(Catalogs)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 1494, 21))
        self.menubar.setObjectName("menubar")
        Catalogs.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(Catalogs)
        self.statusbar.setObjectName("statusbar")
        Catalogs.setStatusBar(self.statusbar)

        self.retranslateUi(Catalogs)
        QtCore.QMetaObject.connectSlotsByName(Catalogs)

    def retranslateUi(self, Catalogs):
        _translate = QtCore.QCoreApplication.translate
        Catalogs.setWindowTitle(_translate("Catalogs", "Catalogs"))
        self.UsernameLabel.setText(_translate("Catalogs", "Username"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Catalogs = QtWidgets.QMainWindow()
    ui = Ui_Catalogs()
    ui.setupUi(Catalogs)
    Catalogs.show()
    sys.exit(app.exec_())
