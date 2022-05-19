## Processes
Daemons  runs in the background and is not interactive.

Services may be interactive and  is run & used by users (vim).
Service also responds to requests from programs.

SSH helps with connecting to a linux machine so to start SSH services youĺl need to start ssh daemon. So before ssh came there was telnet (did the same thing as ssh but not encrypted)

A process is an instance of running code. All code is stored in files somewhere on the system. In order to find these files, Linux will look in the $PATH variable (more about that in a later exercise). Every process has its own PID (Process ID) number.


##  Key Terms
SSH (secure shell)
# exercise

# Start the telnet daemon.

First install telnet

ismael@Nest-Is-Yassin:~$ sudo apt install telnetd -y  
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  libfreetype6
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  openbsd-inetd tcpd update-inetd
The following NEW packages will be installed:
  openbsd-inetd tcpd telnetd update-inetd
0 upgraded, 4 newly installed, 0 to remove and 3 not upgraded.
Need to get 114 kB of archives.
After this operation, 413 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/main amd64 update-inetd all 4.50 [24.8 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 tcpd amd64 7.6.q-30 [24.4 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal/universe amd64 openbsd-inetd amd64 0.20160825-4build1 [26.4 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal/universe amd64 telnetd amd64 0.17-41.2build1 [38.8 kB]
Fetched 114 kB in 1s (207 kB/s)
Preconfiguring packages ...
Selecting previously unselected package update-inetd.
(Reading database ... 31898 files and directories currently installed.)
Preparing to unpack .../update-inetd_4.50_all.deb ...
Unpacking update-inetd (4.50) ...
Selecting previously unselected package tcpd.
Preparing to unpack .../tcpd_7.6.q-30_amd64.deb ...
Unpacking tcpd (7.6.q-30) ...
Selecting previously unselected package openbsd-inetd.
Preparing to unpack .../openbsd-inetd_0.20160825-4build1_amd64.deb ...
Unpacking openbsd-inetd (0.20160825-4build1) ...
Selecting previously unselected package telnetd.
Preparing to unpack .../telnetd_0.17-41.2build1_amd64.deb ...
Unpacking telnetd (0.17-41.2build1) ...
Setting up update-inetd (4.50) ...
Setting up tcpd (7.6.q-30) ...
Setting up openbsd-inetd (0.20160825-4build1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/inetd.service → /lib/systemd/system/inetd.service.
Setting up telnetd (0.17-41.2build1) ...
Adding user telnetd to group utmp
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for systemd (245.4-4ubuntu3.16) ...

ismael@Nest-Is-Yassin:~$ systemctl status inetd
● inetd.service - Internet superserver
     Loaded: loaded (/lib/systemd/system/inetd.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2022-05-06 07:50:40 UTC; 26s ago
       Docs: man:inetd(8)
   Main PID: 8868 (inetd)
      Tasks: 1 (limit: 4623)
     Memory: 884.0K
        CPU: 5ms
     CGroup: /system.slice/inetd.service
             └─8868 /usr/sbin/inetd
             
# Find out the PID of the telnet daemon.
# Find out how much memory telnetd is using.

ismael@Nest-Is-Yassin:~$ sudo systemctl status inetd
● inetd.service - Internet superserver
     Loaded: loaded (/lib/systemd/system/inetd.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2022-05-06 07:50:40 UTC; 4min 4s ago
       Docs: man:inetd(8)
   Main PID: 8868 (inetd)
      Tasks: 1 (limit: 4623)
     Memory: 884.0K
        CPU: 14ms
     CGroup: /system.slice/inetd.service
             └─8868 /usr/sbin/inetd

May 06 07:50:40 Nest-Is-Yassin systemd[1]: Starting Internet superserver...
May 06 07:50:40 Nest-Is-Yassin systemd[1]: Started Internet superserver.             



# Stop or kill the telnetd process.

ismael@Nest-Is-Yassin:~$ sudo systemctl status inetd
● inetd.service - Internet superserver
     Loaded: loaded (/lib/systemd/system/inetd.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2022-05-06 07:50:40 UTC; 35min ago
       Docs: man:inetd(8)
   Main PID: 8868 (inetd)
      Tasks: 1 (limit: 4623)
     Memory: 880.0K
        CPU: 107ms
     CGroup: /system.slice/inetd.service
             └─8868 /usr/sbin/inetd

May 06 07:50:40 Nest-Is-Yassin systemd[1]: Starting Internet superserver...
May 06 07:50:40 Nest-Is-Yassin systemd[1]: Started Internet superserver.

ismael@Nest-Is-Yassin:~$ sudo systemctl stop inetd


ismael@Nest-Is-Yassin:~$ sudo systemctl status inetd
● inetd.service - Internet superserver
     Loaded: loaded (/lib/systemd/system/inetd.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Fri 2022-05-06 08:26:42 UTC; 43s ago
       Docs: man:inetd(8)
    Process: 8868 ExecStart=/usr/sbin/inetd (code=exited, status=0/SUCCESS)
   Main PID: 8868 (code=exited, status=0/SUCCESS)
        CPU: 108ms

May 06 07:50:40 Nest-Is-Yassin systemd[1]: Starting Internet superserver...
May 06 07:50:40 Nest-Is-Yassin systemd[1]: Started Internet superserver.
May 06 08:26:42 Nest-Is-Yassin systemd[1]: Stopping Internet superserver...
May 06 08:26:42 Nest-Is-Yassin systemd[1]: inetd.service: Succeeded.
May 06 08:26:42 Nest-Is-Yassin systemd[1]: Stopped Internet superserver.

## Sources
https://www.javatpoint.com/linux-telnet-command
