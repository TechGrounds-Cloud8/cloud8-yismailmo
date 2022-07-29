# Working with text (CLI)

Introduction:

Every command in Linux has a standard input and output.
The standard input (stdin) is the keyboard. 

If I run ‘mkdir myfolder’, the mkdir command will know what folder to create, because I typed ‘myfolder’.

The standard output (stdout) is the terminal. The command ‘echo hello’ will write ‘hello’ in the terminal.

Both the input and output can be redirected to a file instead of the default. This is called input redirection and output redirection. 
A pipe can be used to have the output of one command be the input of another command.

# Key terminologies

- echo (print to terminal)

- echo text > filename (print to file)

- echo text >> filename (append newline to file)

- cat textfile (prints contents of textfile to terminal)

- grep -> "global regular expression print" (use this to filter partial text)

Requirements:
Your Linux machine
A text file with 2 lines of text

# Exercise:
Use the echho command and output redirection to write a new sentence into your text file using the command line. The new sentence should contain the word ‘techgrounds’. 

**First step is to create a techgrounds file and edit it by adding the text in nano the following text file.**

*Hi

Techgrounds enjoy your journey.
techground*
in nano the  the text file by

by using the following command

        nano samen.txt

        Then I added the text techgrounds by redirecting it to the file techgrounds.txt** using the following command

        echo "techground" >> techgrounds.txt**

        to test that the techgrounds.txt file had been edited I used the following command

        cat "techgrounds.txt"




Use a command to write the contents of your text file to the terminal. Make use of a command to filter the output so that only the sentence containing ‘techgrounds’ appears.


So for this I created another text file and I edited the following sentence 'techgrounds is top' by using the following command
nano samen.txt
So inorder to **only highlight the word 'techgrounds'** in the samen.txt file i used 

**grep "techgrounds" samen.txt**


Read your text file with the command used in the second step, once again filtering for the word ‘techgrounds’. This time, redirect the output to a new file called ‘techgrounds.txt’.

To read and filter for the word 'techground' in the file i used 
grep "techgrounds" samen.txt

After that i **redirect the output** by 

**grep "techgrounds" samen.txt >> nieuwesamen.txt**

So to **test the redirection** went good i used

**cat nieuwesamen.txt**


After that I redirect it to a new file techgrounds.txt
mv nieuwesamen.txt techgrounds.txt

To test this again
cat nieuwesamen.txt


![echo command and output redirection to write a new sentence into my text file](../../00_includes/LNXEchoNanoFile.png)


![Cat files](../../00_includes/LNXCATFiles.png)

# Challenges overcame

Learning how to redirect files and using grep.

# Sources

https://www.w3cschoool.com/linux-grep

https://www.w3cschoool.com/linux-create-file
