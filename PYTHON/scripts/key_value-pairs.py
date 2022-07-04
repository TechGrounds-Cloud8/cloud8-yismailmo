

Dict = { 
    "Firstname": "Casper",
    "Lastname": "Velzen",
    "Job title": "Learning coach",
    "Company": "Techgrounds",

}
for y, z in Dict.items():
    print(y, ":", z )

import csv
from hashlib import new


dict = {
    "First Name": input("First name: "), 
    "Last Name": input("Last name: "),
    "Job Title": input("Job Title: "),
    "Company": input("Company: "),
}

with open('thecsvfile.csv', 'a', newline= "") as f:
    w = csv.writer(f)
    w.writerow(dict.keys())
    w.writerow(dict.values())


print(dict)