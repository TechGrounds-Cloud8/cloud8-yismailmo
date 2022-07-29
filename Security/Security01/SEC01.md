# Network detection

Introduction:
In order to prevent or stop attacks on a network, you must be able to analyse your network. There are many tools available to do this, but this exercise will focus on two very popular ones: 

NMAP;  

Nmap (Network Mapper) is a tool that scans a network to find information about it. For example, what ports are open in a host in your network.





Wireshark;

is a protocol analyzer. It looks at network traffic and shows information about packets like protocol and destination (among other things).

Requirements:

Your Linux machine
Wireshark




Study:

#### Scan the network of your Linux machine using nmap. What do you find?

Commands used 

sudo apt-get install nmap -y --> to install nmap on my Linux machine

sudo nmap -v --> to scan the open ports in the network
 
sudo nmap -sP --> ping scan which means,  identifies all of the IP addresses that are currently online without sending any packets to these hosts.
 
sudo ip r --> to  get ip address

sudo nmap -sn (ip address range 10.126.176.0/24) --> gets you a list of the devices connected to the network.




#### Open Wireshark in Windows/MacOS Machine. Analyse what happens when you open an internet browser. (Tip: you will find that Zoom is constantly sending packets over the network. You can either turn off Zoom for a minute, or look for the packets sent by the browser between the packets sent by Zoom.)



#### Challenges:

Took a lot time  to download wireshark on own computer.

### sources


https://phoenixnap.com/kb/how-to-install-nmap-ubuntu-18-04


https://www.varonis.com/blog/nmap-commands


https://www.howtogeek.com/423709/how-to-see-all-devices-on-your-network-with-nmap-on-linux/


