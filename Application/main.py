import rsa, os, sys, inspect
import datetime

dir = os.path.dirname(os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe()))))
sys.path.insert(0, dir)

import Application.Controller.LoginController.LoginController as lc
import Application.Model.DatabaseConnection.Instructions as I
from Application.Model.DatabaseConnection.Database import Database

if __name__ == '__main__':
    lc = lc.LogInController()
    # data = []
    # db = Database.getInstance()
    # db.connect('ge/ge@//localhost:1521/JUDICIALRECORDSYSTEM')
    # db.logUser('MCHA587', 'PasSwOrd1')
    # result = db.userQuery(I.PROCEDURE, I.GET_DANGEROUS_ZONES, parameters=data, getRows=True)
    # for i in result: print(i)