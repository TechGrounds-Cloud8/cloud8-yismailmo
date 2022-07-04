# Key-value pairs

Key-value pairs are a general concept you will definitely encounter. Some examples of where you will find them are NoSQL databases or AWS resource tags. Dictionaries (dict) in Python also use key-value pairs to store information.

Dicts in Python are written using curly brackets {}. You can get values from the dict by calling its key. 

# Exercise 1:
Create a new script.

Create a dictionary with the following keys and values:
Key
Value
First name
Casper
Last name
Velzen
Job title
Lead Learning Coach
Company
TechGrounds

```python

Dict = { 
    "Firstname": "Casper",
    "Lastname": "Velzen",
    "Job title": "Learning coach",
    "Company": "Techgrounds",

}
for y, z in Dict.items():
    print(y, ":", z )


```
Output:

{'Firstname': 'Casper', 'Lastname': 'Velzen', 'Job title': 'Learning coach', 'Company': 'Techgrounds'}
Loop over the dictionary and print every key-value pair in the terminal.

# Exercise 2:
Create a new script.

Use user input to ask for their information (first name, last name, job title, company). Store the information in a dictionary.
Write the information to a csv file (comma-separated values). The data should not be overwritten when you run the script multiple times.

```python

import csv #  It is required to import the csv module in Python in order to use the functions included in this module to read the file.


Dict = {
    "First Name": input("First name: "), 
    "Last Name": input("Last name: "),
    "Job Title": input("Job Title: "),
    "Company": input("Company: "),
}


with open('thecsvfile.csv', 'a') as f:
    w = csv.writer(f)
    w.writerow(dict.keys())
    w.writerow(dict.values())
# to open a csv file in 'w' (write)mode with the help of open() function and write key value pair in comma separated form. 

print(dict)

```
Output:

{'First Name': 'Ismail', 'Last Name': 'Yassin', 'Job Title': 'Student', 'Company': 'Techgrounds'}
### Sources

https://www.w3schools.com/python/python_dictionaries_loop.asp

https://www.tutorialspoint.com/how-to-read-csv-file-in-python

 https://stackoverflow.com/questions/10373247/how-do-i-write-a-python-dictionary-to-a-csv-file?noredirect=1&lq=1
