import csv
import Application.Model.DatabaseConnection.Database as dbo

db = dbo.Database('ge/ge@//localhost:1521/JUDICIALRECORDSYSTEM')
    
with open('D://GitHub//Judicial-Record-System//Data Parser//CSV Files//Demographic//Users.csv', "r", encoding='utf-8') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    info = []

    for row in csv_reader:
        info.append(row)


for i in info[1:]:
    db.signUp(i[0], i[1])

db.disconnect()