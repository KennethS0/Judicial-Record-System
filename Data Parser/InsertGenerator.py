# DATA PARSER, GENERATES .sql FILES FROM THE INFORMATION IN CSV FILES
import csv

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
    
    file = open(pFileName, 'a')

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
    provinceColumns = ['id', 'country_id', 'name', 'creation_user']
    provinceRows = []
    data = read_csv('.//CSV FILES//provinces.csv')

    for row in data:
        provinceRows.append([row[0], 
                            '1',
                            "'{}'".format(row[1]).upper(),
                            'USER'])


    generateInsert('Province.sql', 'province', provinceColumns, provinceRows)

    # === CANTONS ===
    cantonColumns = ['id', 'province_id', 'name', 'creation_user']
    cantonRows = []
    data = read_csv('.//CSV FILES//cantons.csv')

    for row in data:
        cantonRows.append([str(int(float(row[35]))), 
                            str(int(float(row[13]))),
                            "'{}'".format(row[16]).upper(),
                            'USER'])

    generateInsert('Canton.sql', 'canton', cantonColumns, cantonRows)

    # === DISTRICTS === 
    districtColumns = ['id', 'canton_id', 'name', 'creation_user']
    districtRows = []
    data = read_csv('.//CSV FILES//districts.csv')

    for row in data:
        districtRows.append([str(int(float(row[-1]))), 
                            str(int(float(row[39]))),
                            "'{}'".format(row[24]).upper(),
                            'USER'])

    generateInsert('District.sql', 'district', districtColumns, districtRows)