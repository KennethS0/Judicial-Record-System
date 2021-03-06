# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'login.ui'
#
# Created by: PyQt5 UI code generator 5.15.0
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(1120, 707)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(MainWindow.sizePolicy().hasHeightForWidth())
        MainWindow.setSizePolicy(sizePolicy)
        MainWindow.setAutoFillBackground(False)
        MainWindow.setTabShape(QtWidgets.QTabWidget.Rounded)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.frame = QtWidgets.QFrame(self.centralwidget)
        self.frame.setGeometry(QtCore.QRect(0, 0, 1131, 701))
        self.frame.setAutoFillBackground(True)
        self.frame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.frame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.frame.setObjectName("frame")
        self.UserName_Login = QtWidgets.QLineEdit(self.frame)
        self.UserName_Login.setEnabled(True)
        self.UserName_Login.setGeometry(QtCore.QRect(789, 260, 221, 21))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.UserName_Login.setFont(font)
        self.UserName_Login.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.UserName_Login.setAcceptDrops(True)
        self.UserName_Login.setAutoFillBackground(False)
        self.UserName_Login.setFrame(False)
        self.UserName_Login.setClearButtonEnabled(False)
        self.UserName_Login.setObjectName("UserName_Login")
        self.Password_Login = QtWidgets.QLineEdit(self.frame)
        self.Password_Login.setEnabled(True)
        self.Password_Login.setGeometry(QtCore.QRect(789, 314, 221, 21))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.Password_Login.setFont(font)
        self.Password_Login.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.Password_Login.setAcceptDrops(True)
        self.Password_Login.setAutoFillBackground(False)
        self.Password_Login.setFrame(False)
        self.Password_Login.setEchoMode(QtWidgets.QLineEdit.Password)
        self.Password_Login.setClearButtonEnabled(False)
        self.Password_Login.setObjectName("Password_Login")
        self.BackgroundLabel_Login = QtWidgets.QLabel(self.frame)
        self.BackgroundLabel_Login.setGeometry(QtCore.QRect(0, 0, 1161, 681))
        self.BackgroundLabel_Login.setText("")
        self.BackgroundLabel_Login.setTextFormat(QtCore.Qt.PlainText)
        self.BackgroundLabel_Login.setPixmap(QtGui.QPixmap("Images/Login/SignInPage.png"))
        self.BackgroundLabel_Login.setScaledContents(True)
        self.BackgroundLabel_Login.setObjectName("BackgroundLabel_Login")
        self.LoginButton_Login = QtWidgets.QPushButton(self.frame)
        self.LoginButton_Login.setGeometry(QtCore.QRect(806, 430, 141, 41))
        self.LoginButton_Login.setText("")
        self.LoginButton_Login.setFlat(True)
        self.LoginButton_Login.setObjectName("LoginButton_Login")
        self.BackgroundLabel_Login.raise_()
        self.UserName_Login.raise_()
        self.Password_Login.raise_()
        self.LoginButton_Login.raise_()
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 1120, 21))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Login"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
