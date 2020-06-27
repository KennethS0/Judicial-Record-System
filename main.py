from Application.Model.Database import Database
import Application.Model.Instructions as I

if __name__ == '__main__':
    db = Database('ge/ge@//localhost:1521/Judicial_Record_System')

    db.logUser('KSANCHEZ0', '6deebef7ced82f6a0050f60102ffc4407a430c3ccfb8ff6d93b1dbf8056ed967')
    
    values = db.adminQuery(I.PROCEDURE , I.MODIFIED_PASSWORDS,
                             parameters=['4/JUN/2020', '26/JUN/2020'], getRows=True)
    print(values.fetchall())

    values2 = db.userQuery(I.PROCEDURE, I.GET_ALL_USERS,  getRows=True)
    print(values2.fetchall())

    db.disconnect()