from Application.Model.Database import Database

if __name__ == '__main__':
    db = Database('ge/ge@//localhost:1521/Judicial_Record_System')

    db.signUp('KSANCHEZ01', '6deebef7ced82f6a0050f60102ffc4407a430c3ccfb8ff6d93b1dbf8056ed967')
    
    db.disconnect()