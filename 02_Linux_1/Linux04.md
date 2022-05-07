# Users and groups
Users and groups
introduction:
linux has users, similar to accounts on windows and macos. every user has their own home directory. users can also be part of groups.
there is a special user called ‘root’. Root is allowed to do anything.
To gain temporary root permissions, you can type ‘sudo’ in front of a command, but that only works if you’re allowed to do that.

Some actions require (root) permissions.

Users, passwords, and groups are all stored in  (different) files across the system.

# Key terminology




Exercise:
Create a new user in your VM. 

sudo useradd yaska

The new user should be part of an admin group.
 sudo groupadd yaska

The new user should have a password.
sudo passwd yaska

The new user should be able to use ‘sudo’
Locate the files that store users, passwords, and groups. See if you can find your newly created user’s data in there.

cat etc/group

to test if the new user data is created

grep yaska

### Sources
[List your sources you used for solving the exercise]

https://linuxize.com/post/how-to-add-user-to-group-in-linux/

https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/


### Overcome challanges
My laptop crushed so I was late with this assignment and i will need to rewrite the steps of the answers again in a little more detailed if i had more time.

### Results

![screenshot user&group](My files/Linux files/cloud8-yismailmo/00_includes/LNX04-1.png)
