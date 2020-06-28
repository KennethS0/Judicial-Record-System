import Application.Model.DatabaseConnection.Database as dbo
from Application.Model.DatabaseConnection import Instructions as I

if __name__ == '__main__':
    db = dbo.Database('ge/ge@//localhost:1521/Judicial_Record_System')

    db.logUser('KSANCHEZ0', '6deebef7ced82f6a0050f60102ffc4407a430c3ccfb8ff6d93b1dbf8056ed967')
    
    values = db.adminQuery(I.PROCEDURE , I.GET_UNRESOLVED_RECORDS, getRows=True)
    print(values.fetchall())

    db.disconnect()