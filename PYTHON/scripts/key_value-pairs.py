

Dict = { 
    "Firstname": "Casper",
    "Lastname": "Velzen",
    "Job title": "Learning coach",
    "Company": "Techgrounds",

}
print(Dict)

import csv


dict = {
    "First Name": input("First name: "), 
    "Last Name": input("Last name: "),
    "Job Title": input("Job Title: "),
    "Company": input("Company: "),
}

with open('thecsvfile.csv', 'a') as f:
    w = csv.writer(f)
    w.writerow(dict.keys())
    w.writerow(dict.values())


print(dict)