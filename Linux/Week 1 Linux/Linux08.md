# Cron jobs
Introduction:
There might be processes that you want to execute on a regular schedule. For example, you might want to write the available disk space to a log file every hour. Or maybe you want to check for system updates every 2nd day of the month.

These kinds of jobs can be automated using Cron jobs.
## key terminolgy

Cron Jobs = to schedule a task at a specific time.
a b c d e = minute(a) hour(b) day(c) month(d) day of the week(e),  using this format to decide when the cron job will automatically run.
$crontab -1 = to display the contents of the crontab file of the currently logged in user.
$crontab -e = to edit the current user's cron jobs.


Requirements:
Your Linux machine


Exercise:


### Create a Bash script that writes the current date and time to a file in your home directory.

first step i created Bash script to show the date and time to right to "date.txt"
date > /home/ismael/time.sh/date.txt

So i tested whether i can show the date and time  by
cat date.txt





### Register the script in your crontab so that it runs every minute.
So to run the cronjab every 1 minute I Added the following cron job within crontab

first by using "crontab -e" to gain access with the following
* * * * * /home/ismael/time.sh/timing.sh
but unfortunately i did not work

### Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron job so that it runs weekly.

### source
https://ostechnix.com/a-beginners-guide-to-cron-jobs/


https://www.cyberciti.biz/faq/how-to-run-cron-job-every-minute-on-linuxunix/


https://itsfoss.com/cron-job/

https://crontab.guru/examples.html

https://www.cyberciti.biz/faq/unix-linux-getting-current-date-in-bash-ksh-shell-script/#:~:text=Sample%20shell%20script%20to%20display,scripts%20goes%20here%20%23%20...

https://phoenixnap.com/kb/set-up-cron-job-linux

![date&time](../../00_includes/blob:chrome-untrusted://media-app/32a6d66b-fca6-4b66-895f-c4fea315e368)
![cronjobs](../../blob:chrome-untrusted://media-app/e6f7263b-92f2-4bac-8a94-516c37d35627)
### Overcome challanges
Couldn't finish the second and third question even when me and my team mates even asked help from other groups.


