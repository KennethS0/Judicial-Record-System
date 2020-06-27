from Application.Model.Database import Database

if __name__ == '__main__':
    db = Database('ge/ge@//localhost:1521/Judicial_Record_System')

    db.logUser('MARIABLANCOSANDRA', 'bc0c67c6c9833fed5acd7f6d156755092aa076f1a1e808196e7a25bbf44449a5')
    
    db.disconnect()