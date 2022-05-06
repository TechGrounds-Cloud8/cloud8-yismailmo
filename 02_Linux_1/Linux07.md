## Bash scripting
Introduction:
The default command line interface in Linux is called a Bash shell. You’ve already interacted with Linux using commands in this shell.
A Bash script is a series of commands written in a text file. You can execute multiple commands in a row by just executing the script.
Additional logic can be applied with the use of variables, conditions, and loops among others.

In order to be able to execute the script, a user needs to have permissions to execute (x) the file.
Linux will only be able to find the script if you specify the path name, or if you add the path to the directory in which the script lives to the PATH variable.

Hint: although there are no file extensions in Linux, it’s easier for humans to understand if you end your script names with ‘.sh’.

Requirements:
Your Linux machine
Exercise 1:
# Create a directory called ‘scripts’. Place all the scripts you make in this directory.

ismael@Nest-Is-Yassin:~$ mkdir scripts
ismael@Nest-Is-Yassin:~$ ls
scripts  techgrounds
ismael@Nest-Is-Yassin:~$ cd scripts
ismael@Nest-Is-Yassin:~/scripts$ 


# Add the scripts directory to the PATH variable.
Create a script that appends a line of text to a text file whenever it is executed.

ismael@Nest-Is-Yassin:~$ ls
scripts  techgrounds
ismael@Nest-Is-Yassin:~$ cd scripts
ismael@Nest-Is-Yassin:~/scripts$ pwd
/home/ismael/scripts
ismael@Nest-Is-Yassin:~/scripts$ nano vrijdag.txt
ismael@Nest-Is-Yassin:~/scripts$ cat vrijdag.txt 
Hallo
het is vrijdag
ismael@Nest-Is-Yassin:~/scripts$ echo ‘Het is vrijdag ochtend’ >> vrijdag.txt
ismael@Nest-Is-Yassin:~/scripts$ cat vrijdag.txt 
Hallo
het is vrijdag
‘Het is vrijdag ochtend’
ismael@Nest-Is-Yassin:~/scripts$ 

# Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.

ismael@Nest-Is-Yassin:~/scripts$ sudo apt update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Hit:2 http://archive.ubuntu.com/ubuntu focal InRelease           
Get:3 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [1750 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [920 kB]
Fetched 3007 kB in 2s (1827 kB/s)                        
Reading package lists... Done
Building dependency tree       
Reading state information... Done
3 packages can be upgraded. Run 'apt list --upgradable' to see them.
ismael@Nest-Is-Yassin:~/scripts$ sudo apt install apache2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  libfreetype6
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libjansson4 liblua5.2-0 ssl-cert
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom www-browser openssl-blacklist
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libjansson4 liblua5.2-0 ssl-cert
0 upgraded, 11 newly installed, 0 to remove and 3 not upgraded.
Need to get 1866 kB of archives.
After this operation, 8091 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu focal/main amd64 libapr1 amd64 1.6.5-1ubuntu1 [91.4 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/main amd64 libaprutil1 amd64 1.6.1-4ubuntu2 [84.7 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal/main amd64 libaprutil1-dbd-sqlite3 amd64 1.6.1-4ubuntu2 [10.5 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal/main amd64 libaprutil1-ldap amd64 1.6.1-4ubuntu2 [8736 B]
Get:5 http://archive.ubuntu.com/ubuntu focal/main amd64 libjansson4 amd64 2.12-1build1 [28.9 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal/main amd64 liblua5.2-0 amd64 5.2.4-1.1build3 [106 kB]

# Variables:
# You can assign a value to a string of characters so that the value can be read somewhere else in the script.Assigning a variable is done using ‘=’.Reading the value of a variable is done using ‘$<insert variable name here>’.

    
ismael@Nest-Is-Yassin:~/scripts$ echo $(( $RANDOM % 10 + 1 ))
10
ismael@Nest-Is-Yassin:~/scripts$ 14
14: command not found
ismael@Nest-Is-Yassin:~/scripts$ echo $(( $RANDOM % 10 + 1 ))
4

    
# Exercise 2:
# Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.

    

ismael@Nest-Is-Yassin:~/scripts$ nano friday.sh
ismael@Nest-Is-Yassin:~/scripts$ echo $(( $RANDOM % 10 + 1 )) >> friday.sh
ismael@Nest-Is-Yassin:~/scripts$ cat friday.sh
hi 
coool    
    
    
Conditions:
You can choose to only run parts of your script if a certain condition is met. For example, only read a file if the file exists, or only write to a log if the health check returns an error. This can be done using conditions.

A check for a condition can be done using ‘if’, ‘elif’, and/or ‘else’.

Exercise 3:
Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file only if the number is bigger than 5. If the number is 5 or smaller, it should append a line of text to that same text file instead.

    
myvar=$(($RANDOM%10+1))

if [ $myvar -gt 5 ]
then
        echo $myvar >> friday.txt
else
        echo "Value is smaller than 5" >> friday.txt
fi

cat friday.txt    
    
ismael@Nest-Is-Yassin:~/scripts$ ./friday.sh
#!/bin/bash
hi
good day
6
8 
    
    
9
8
7
6
9
Value is smaller than 5
Value is smaller than 5
Value is smaller than 5
ismael@Nest-Is-Yassin:~/scripts$ ./friday.sh

    
Sources:
    
    
    
 https://mkyong.com/apache/how-to-install-apache-http-server-in-ubuntu/
   
    
https://www.cyberciti.biz/faq/linux-install-and-start-apache-httpd/    
    


https://linuxize.com/post/how-to-add-user-to-group-in-linux/

https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/


### Overcome challanges
My laptop crushed so I was late with this assignment and i will need to rewrite the steps of the answers again in a little more detailed if i had more time.


