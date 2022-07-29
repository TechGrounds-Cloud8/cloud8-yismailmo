## Bash scripting
Introduction:
The default command line interface in Linux is called a Bash shell also know as Bourne again shell. 
A Bash script = series of commands written into a text file. 

PATH (not to confuse with path of a directory address) = environmental variable that tells the shell which directories to search for a file.

= = Use this to assign a variable

export PATH=$PATH:/some/new/path = Use this command to add paths to PATH variable

export PATH=/some/new/path:$PATH = Use this command to set a path

Hint: although there are no file extensions in Linux, it’s easier for humans to understand if you end your script names with ‘.sh’.

Requirements:
Your Linux machine
## Exercises:

#### Create a directory called ‘scripts’. Place all the scripts you make in this directory.
mkdir scripts then cd scripts



### Add the scripts directory to the PATH variable.
Create a script that appends a line of text to a text file whenever it is executed.


[scripts](../../00_includes/LNX07-1.png)
# Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.



# Variables:
# You can assign a value to a string of characters so that the value can be read somewhere else in the script.Assigning a variable is done using ‘=’.Reading the value of a variable is done using ‘$<insert variable name here>’.

    


    
## Exercise 2:
# Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.

    


Conditions:
You can choose to only run parts of your script if a certain condition is met. For example, only read a file if the file exists, or only write to a log if the health check returns an error. This can be done using conditions.

A check for a condition can be done using ‘if’, ‘elif’, and/or ‘else’.

Exercise 3:
Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file only if the number is bigger than 5. If the number is 5 or smaller, it should append a line of text to that same text file instead.

  


### Challenges overcame

Learning about apache and creating a script that generates a random number

# Sources:
    
    
    
 https://mkyong.com/apache/how-to-install-apache-http-server-in-ubuntu/
   
    
https://www.cyberciti.biz/faq/linux-install-and-start-apache-httpd/    
    


https://linuxize.com/post/how-to-add-user-to-group-in-linux/

https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/




