from Application.Model.Database import Database
import Application.Model.Instructions as Instructions

if __name__ == '__main__':
    db = Database('ge/ge@//localhost:1521/Judicial_Record_System')

    db.logUser('KSANCHEZ0', '6deebef7ced82f6a0050f60102ffc4407a430c3ccfb8ff6d93b1dbf8056ed967')
    
    values = db.adminQuery(Instructions.PROCEDURE , Instructions.MODIFIED_PASSWORDS, ['4/JUN/2020', '26/JUN/2020'])
    print(values)

    values2 = db.adminQuery(Instructions.PROCEDURE, Instructions.UNRESOLVED_RECORDS)
    print(values2)
    
    db.disconnect()