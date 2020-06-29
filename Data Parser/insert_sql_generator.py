# DATA PARSER, GENERATES .sql FILES FROM THE INFORMATION IN CSV FILES
import csv
import datetime
import random


# Reads a .csv file and returns its reader
def read_csv(pFile):
    with open(pFile, "r", encoding='utf-8') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        info = []

        for row in csv_reader:
            info.append(row)

        return info[1:]


# Generates a .sql file with the specific inserts
def generateInsert(pFileName, pTable, pColumns, pValues):
    
    file = open(pFileName, 'a', encoding='utf-8')

    columns= ', '.join(pColumns)

    file.write("INSERT ALL\n")

    for row in pValues:
        values = ', '.join(row)
        string = ' ' * 3 + 'INTO {}({}) VALUES ({})'.format(pTable, columns, values) + '\n'
        file.write(string)

    file.write('SELECT * FROM DUAL;')
    file.close()

# MAIN
if __name__ == '__main__':
    
    # === PROVINCES ===
    provinceColumns = ['id', 'country_id', 'name']
    provinceRows = []
    data = read_csv('.//CSV FILES//provinces.csv')

    for row in data:
        provinceRows.append([
            row[0], 
            '1',
            "'{}'".format(row[1]).upper()
            ])


    generateInsert('Province.sql', 'province', provinceColumns, provinceRows)

    # === CANTONS ===
    cantonColumns = ['id', 'province_id', 'name']
    cantonRows = []
    data = read_csv('.//CSV FILES//cantons.csv')

    for row in data:
        cantonRows.append([
            str(int(float(row[35]))), 
            str(int(float(row[13]))),
            "'{}'".format(row[16]).upper()
            ])

    generateInsert('Canton.sql', 'canton', cantonColumns, cantonRows)

    # === DISTRICTS === 
    districtColumns = ['id', 'canton_id', 'name']
    districtRows = []
    data = read_csv('.//CSV FILES//districts.csv')

    for row in data:
        districtRows.append([
            str(int(float(row[-1]))), 
            str(int(float(row[39]))),
            "'{}'".format(row[24]).upper()
            ])

    generateInsert('District.sql', 'district', districtColumns, districtRows)

    # === CIRCUITS ===
    circuitColumns = ['id', 'description_', 'canton_id']
    circuitRows = []
    data = read_csv('.//CSV Files//circuitos.csv')

    for row in data:
        circuitRows.append([
            str(row[0]),
            "'{}'".format(row[1]),
            str(row[2])
            ])

    generateInsert('Judicial_Circuit.sql', 'judicial_circuit', circuitColumns, circuitRows)

    # === OFFICES ===
    officeColumns = ['judicial_circuit_id', 'id', 'name', 'subject_code']
    officeRows = []
    data = read_csv('.//CSV Files//despachos.csv')

    for row in data:
        officeRows.append([
            str(row[0]),
            str(row[1]),
            "'{}'".format(row[2]),
            "'{}'".format(row[3])
            ])

    generateInsert('Office.sql', 'office', officeColumns, officeRows)

    #=== COMMUNITIES ===
    commColumns = ['id', 'district_id', 'name']
    commRows = []
    data = read_csv('.//CSV Files//Geographic//barrios.csv')

    for row in data:
        # Generate correct ID's
        district_id = str(row[0]) + str(row[2]).zfill(2) + str(row[4]).zfill(2)
        id = district_id + str(row[6]).zfill(2)
        
        commRows.append([
            id,
            district_id,
            "'{}'".format(row[7]).upper()
            ])


    generateInsert('Community.sql', 'community', commColumns, commRows)

    # === TEST DATA: Addresses ===
    addressColumns = ['community_id', 'description_']
    addressRows = []
    data = read_csv('D://GitHub//Judicial-Record-System//Data Parser//CSV Files//Geographic//address.csv')

    for row in data:
        addressRows.append([
            row[0],
            "'{}'".format(row[1]).upper()
        ])

    generateInsert('TEST Addresses.sql', 'address', addressColumns, addressRows)

    # === TEST DATA: People ===
    personColumns = ['citizenship_id', 'gender_id', 'address_id', 'user_id', 'first_name',
                    'middle_name', 'last_name', 'secondlast_name', 'birth_date']
    personRows = []
    data = read_csv('D://GitHub//Judicial-Record-System//Data Parser//CSV Files//Demographic//People.csv')

    consec = 1
    for row in data:
        
        start_date = datetime.date(1930, 1, 1)
        end_date = datetime.date.today()

        time_between_dates = end_date - start_date
        days_between_dates = time_between_dates.days
        random_number_of_days = random.randrange(days_between_dates)

        random_date = start_date + datetime.timedelta(days=random_number_of_days)

        personRows.append([
            str(row[0]),
            str(row[5]),
            str(consec),
            str(consec),
            "'{}'".format(row[1]),
            "'{}'".format(row[2]),
            "'{}'".format(row[3]),
            "'{}'".format(row[4]),
            str(random_date)
        ])
        consec += 1
    generateInsert('TEST People.sql', 'person', personColumns, personRows)