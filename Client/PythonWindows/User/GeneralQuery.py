# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'GeneralQuery.ui'
#
# Created by: PyQt5 UI code generator 5.15.0
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_User_GeneralQuery(object):
    def setupUi(self, User_GeneralQuery):
        User_GeneralQuery.setObjectName("User_GeneralQuery")
        User_GeneralQuery.resize(1527, 891)
        self.centralwidget = QtWidgets.QWidget(User_GeneralQuery)
        self.centralwidget.setObjectName("centralwidget")
        self.BackgroundFrame = QtWidgets.QFrame(self.centralwidget)
        self.BackgroundFrame.setGeometry(QtCore.QRect(0, 0, 1531, 861))
        self.BackgroundFrame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.BackgroundFrame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.BackgroundFrame.setObjectName("BackgroundFrame")
        self.BackgroundLabel = QtWidgets.QLabel(self.BackgroundFrame)
        self.BackgroundLabel.setGeometry(QtCore.QRect(0, 0, 1521, 861))
        self.BackgroundLabel.setText("")
        self.BackgroundLabel.setPixmap(QtGui.QPixmap("Images/User-GeneralQuery.png"))
        self.BackgroundLabel.setScaledContents(True)
        self.BackgroundLabel.setObjectName("BackgroundLabel")
        self.HomeButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.HomeButton.setGeometry(QtCore.QRect(0, 70, 241, 51))
        self.HomeButton.setText("")
        self.HomeButton.setFlat(True)
        self.HomeButton.setObjectName("HomeButton")
        self.PersRegisterButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.PersRegisterButton.setGeometry(QtCore.QRect(0, 240, 241, 51))
        self.PersRegisterButton.setText("")
        self.PersRegisterButton.setFlat(True)
        self.PersRegisterButton.setObjectName("PersRegisterButton")
        self.UsernameLabel = QtWidgets.QLabel(self.BackgroundFrame)
        self.UsernameLabel.setGeometry(QtCore.QRect(1390, 20, 81, 21))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(14)
        self.UsernameLabel.setFont(font)
        self.UsernameLabel.setCursor(QtGui.QCursor(QtCore.Qt.BlankCursor))
        self.UsernameLabel.setAutoFillBackground(False)
        self.UsernameLabel.setStyleSheet("color: rgb(234, 234, 234);")
        self.UsernameLabel.setObjectName("UsernameLabel")
        self.RecordRegisterButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.RecordRegisterButton.setGeometry(QtCore.QRect(0, 120, 241, 51))
        self.RecordRegisterButton.setText("")
        self.RecordRegisterButton.setFlat(True)
        self.RecordRegisterButton.setObjectName("RecordRegisterButton")
        self.LogOutButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.LogOutButton.setGeometry(QtCore.QRect(0, 800, 241, 51))
        self.LogOutButton.setText("")
        self.LogOutButton.setFlat(True)
        self.LogOutButton.setObjectName("LogOutButton")
        self.GeneralQueryApplyButt = QtWidgets.QPushButton(self.BackgroundFrame)
        self.GeneralQueryApplyButt.setGeometry(QtCore.QRect(1275, 711, 127, 33))
        self.GeneralQueryApplyButt.setText("")
        self.GeneralQueryApplyButt.setFlat(True)
        self.GeneralQueryApplyButt.setObjectName("GeneralQueryApplyButt")
        self.RecordLookUpButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.RecordLookUpButton.setGeometry(QtCore.QRect(0, 180, 241, 51))
        self.RecordLookUpButton.setText("")
        self.RecordLookUpButton.setFlat(True)
        self.RecordLookUpButton.setObjectName("RecordLookUpButton")
        self.GenQueriesButton = QtWidgets.QPushButton(self.BackgroundFrame)
        self.GenQueriesButton.setGeometry(QtCore.QRect(0, 290, 241, 51))
        self.GenQueriesButton.setText("")
        self.GenQueriesButton.setFlat(True)
        self.GenQueriesButton.setObjectName("GenQueriesButton")
        self.GeneralQueryDisplay = QtWidgets.QLabel(self.BackgroundFrame)
        self.GeneralQueryDisplay.setGeometry(QtCore.QRect(710, 215, 691, 461))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.GeneralQueryDisplay.setFont(font)
        self.GeneralQueryDisplay.setAutoFillBackground(False)
        self.GeneralQueryDisplay.setText("")
        self.GeneralQueryDisplay.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignTop)
        self.GeneralQueryDisplay.setObjectName("GeneralQueryDisplay")
        self.RecordTypeFilter = QtWidgets.QComboBox(self.BackgroundFrame)
        self.RecordTypeFilter.setGeometry(QtCore.QRect(400, 341, 83, 27))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.RecordTypeFilter.setFont(font)
        self.RecordTypeFilter.setObjectName("RecordTypeFilter")
        self.QueryChoice = QtWidgets.QComboBox(self.BackgroundFrame)
        self.QueryChoice.setGeometry(QtCore.QRect(550, 232, 151, 28))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.QueryChoice.setFont(font)
        self.QueryChoice.setObjectName("QueryChoice")
        self.DistrictFilter = QtWidgets.QComboBox(self.BackgroundFrame)
        self.DistrictFilter.setGeometry(QtCore.QRect(401, 503, 83, 26))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.DistrictFilter.setFont(font)
        self.DistrictFilter.setObjectName("DistrictFilter")
        self.DateRangeFilter = QtWidgets.QComboBox(self.BackgroundFrame)
        self.DateRangeFilter.setGeometry(QtCore.QRect(399, 234, 83, 26))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.DateRangeFilter.setFont(font)
        self.DateRangeFilter.setObjectName("DateRangeFilter")
        self.CommunityFilter = QtWidgets.QComboBox(self.BackgroundFrame)
        self.CommunityFilter.setGeometry(QtCore.QRect(400, 557, 84, 26))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.CommunityFilter.setFont(font)
        self.CommunityFilter.setObjectName("CommunityFilter")
        self.ProvinceFilter = QtWidgets.QComboBox(self.BackgroundFrame)
        self.ProvinceFilter.setGeometry(QtCore.QRect(401, 395, 83, 27))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.ProvinceFilter.setFont(font)
        self.ProvinceFilter.setObjectName("ProvinceFilter")
        self.CantonFilter = QtWidgets.QComboBox(self.BackgroundFrame)
        self.CantonFilter.setGeometry(QtCore.QRect(400, 449, 83, 27))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.CantonFilter.setFont(font)
        self.CantonFilter.setObjectName("CantonFilter")
        self.NValueFilter = QtWidgets.QLineEdit(self.BackgroundFrame)
        self.NValueFilter.setEnabled(True)
        self.NValueFilter.setGeometry(QtCore.QRect(407, 290, 71, 21))
        font = QtGui.QFont()
        font.setFamily("Source Sans Pro")
        font.setPointSize(12)
        self.NValueFilter.setFont(font)
        self.NValueFilter.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.NValueFilter.setAcceptDrops(True)
        self.NValueFilter.setAutoFillBackground(False)
        self.NValueFilter.setFrame(False)
        self.NValueFilter.setClearButtonEnabled(False)
        self.NValueFilter.setObjectName("NValueFilter")
        User_GeneralQuery.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(User_GeneralQuery)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 1527, 21))
        self.menubar.setObjectName("menubar")
        User_GeneralQuery.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(User_GeneralQuery)
        self.statusbar.setObjectName("statusbar")
        User_GeneralQuery.setStatusBar(self.statusbar)

        self.retranslateUi(User_GeneralQuery)
        QtCore.QMetaObject.connectSlotsByName(User_GeneralQuery)

    def retranslateUi(self, User_GeneralQuery):
        _translate = QtCore.QCoreApplication.translate
        User_GeneralQuery.setWindowTitle(_translate("User_GeneralQuery", "GeneralQuery"))
        self.UsernameLabel.setText(_translate("User_GeneralQuery", "Username"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    User_GeneralQuery = QtWidgets.QMainWindow()
    ui = Ui_User_GeneralQuery()
    ui.setupUi(User_GeneralQuery)
    User_GeneralQuery.show()
    sys.exit(app.exec_())