import requests
from bs4 import BeautifulSoup
# lxml is also needed.

# Scrapes the page to get all the judicial circuits 
URL = 'https://pjenlinea.poder-judicial.go.cr/SISTEMAGESTIONENLINEAPJ/Publica/wfpConsultaxNue.aspx'
page = requests.get(URL).text

soup = BeautifulSoup(page, 'lxml')

circuits = soup.select('option[value]', id="ctl00_ContentPlaceHolder1_ddlCircuito")
circuitValues = [item.get('value') for item in circuits]
circuitNames = [item.text for item in circuits]


# Writes csv file for circuits
circuitCSV = open('.//CSV Files//circuitos.csv', 'a')
circuitCSV.write('id,name,canton_id\n')

for i in range(len(circuitNames[1:])):
    circuitCSV.write("{},{}\n".format(circuitValues[i], circuitNames[i]))

circuitCSV.close

# Writes csv file for offices
officesCSV = open('.//CSV Files//despachos2.csv', 'a')
officesCSV.write('judicial_circuit_id,id,name,subject_code\n')

# Reads file containing all offices sperated as [CIRCUIT_ID, ID, NAME, SUBJECT]
with open('.//TXT Files//despachos.txt', 'r') as file:
    offices = file.read().split(';')
    for i in range(len(offices)):
        offices[i] = offices[i].split('|')
        offices[i][2] = offices[i][2][5:]
        officesCSV.write('{},{},{},{}\n'.format(offices[i][0],
                                                offices[i][1],
                                                offices[i][2].replace(',', ' -'),
                                                offices[i][3]))

officesCSV.close()
