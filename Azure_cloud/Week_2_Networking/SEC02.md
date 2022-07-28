
# Firewalls

A firewall is a device or a combination of systems that supervises the flow of traffic between distinctive parts of the network. 

A firewall is used to guard and filters using the port numbers, protocals, source and destination of a pakket in the network against nasty people and prohibit their actions at predefined boundary levels.

For Example, a firewall always exists between a private network and the Internet which is a public network thus filters packets coming in and out.

Firewall and OSI Reference Model
A firewall system can work on five layers of the OSI model. But most of them run at only four layers i.e. data-link layer, network layer, transport layer, and application layers.

### Firewall System contains;


1) Perimeter Router
The main reason for using it is to provide a link to a public networking system like the internet, or a distinctive organization. It performs the routing of data packets by following an appropriate routing protocol.

It also provisions the filtering of packets and addresses translations.

2) Firewall
As discussed earlier also its main task is to provisions distinctive levels of security and supervises traffic among each level. Most of the firewall exists near the router to provide security from external threats but sometimes present in the internal network also to protect from internal attacks.

3) VPN
Its function is to provisions a secured connection among two machines or networks or a machine and a network. This consists of encryption, authentication, and, packet-reliability assurance. It provisions the secure remote access of the network, thereby connecting two WAN networks on the same platform while not being physically connected.

4) IDS
Its function is to identify, preclude, investigate, and resolve unauthorized attacks. A hacker can attack the network in various ways. It can execute a DoS attack or an attack from the backside of the network through some unauthorized access. An IDS solution should be smart enough to deal with these types of attacks.

IDS solution is of two kinds, network-based and host-based. A network-based IDS solution should be skilled in such a way whenever an attack is spotted, can access the firewall system and after logging into it can configure an efficient filter that can restrict the unwanted traffic.

A host-based IDS solution is a kind of software that runs on a host device such as a laptop or server, which spots the threat against that device only. IDS solution should inspect network threats closely and report them timely and should take necessary actions against the attacks.


### Firewall Categories
Based on the filtering of traffic there are many categories of the firewall, some are explained below:

#1) Packet Filtering Firewall
It is a kind of router which is having the ability to filter the few of the substance of the data packets. When using packet-filtering, the rules are classified on the firewall. These rules find out from the packets which traffic is permitted and which are not.

#2) Stateful Firewall
It is also called as dynamic packet filtering, it inspects the status of active connections and uses that data to find out which of the packets should be permitted through the firewall and which are not.

The firewall inspects the packet down to the application layer. By tracing the session data like IP address and port number of the data packet it can provide much strong security to the network.

It also inspects both incoming and outgoing traffic thus hackers found it difficult to interfere in the network using this firewall.

#3) Proxy Firewall
These are also known as application gateway firewalls. The stateful firewall is unable to protect the system from HTTP based attacks. Therefore proxy firewall is introduced in the market.

It includes the features of stateful inspection plus having the capability of closely analyzing application layer protocols.

Thus it can monitor traffic from HTTP and FTP and find out the possibility of attacks. Thus firewall behaves as a proxy means the client initiates a connection with the firewall and the firewall in return initiates a solo link with the server on the client’s side.

Software Firewall:


software firewalls operate from inside your computer via an application. They have the same general mission, but they go about it in slightly different ways, giving them their own set of advantages:

Cost less initially: When first purchased, a software firewall is relatively cheap. Some come with a free trial, and after that, a relatively low monthly fee. In the long run, however, the subscription expense may end up being more costly than what you would have paid for a hardware solution.

Require little space: If space is a concern, software may be a better choice because, as an application, it has no footprint.

Easy to install: Many software firewalls only require a few clicks to be up and running, whereas hardware firewalls require attaching wires, connecting to power, and proper positioning.

At the same time, the protection of a software firewall also comes with limitations. They have to be installed on every computer in the network. When it comes time to update your protection, if any of the units are not prepared to receive the update, they have to be updated manually. Since they don't have their own operating systems, software firewalls can also drain crucial computing power and memory, affecting user experience and network security.

ufw is the standard Ubuntu firewall.

What is a Hardware Firewall?
A hardware firewall acts as a gatekeeper and antivirus solution for your server. It sits directly behind the router and can be configured to analyze incoming traffic, filtering out specific threats as they come across the device.

A hardware firewall is a physical device much like a server that filters the traffic going to a computer. While a user would normally plug a network cable directly into a computer or server, with a hardware firewall, the cable is plugged into the firewall first. The firewall sits between the external network and the server, providing an antivirus solution and a hard barrier against intrusions. 

A hardware firewall provides several benefits:

Can be used to intelligently control the traffic that reaches your server

Can be configured with specific rules for all traffic

Can ease the burden on other server resources. For example, you can disable software firewalls, which can free up much-needed memory and processor power


Een firewall kan dit verkeer filteren op protocol, poortnummer, bron en bestemming van een pakket. 






Bestudeer:
De verschillende types firewall
stateful / stateless
hardware / software
### Benodigdheden:


Je Linux machine
Je unieke poortnummer voor http-verkeer

### Opdracht:
#### Installeer een webserver op je VM.

Sudo apt-get install apache2
Then i checked my using:
ip address (18.196.32.244): port(55815) = 18.196.32.244:55815


#### Bekijk de standaardpagina die met de webserver geïnstalleerd is.

Apache2 ubuntu default page

#### Stel de firewall zo in dat je webverkeer blokkeert, maar wel ssh-verkeer toelaat.Controleer of de firewall zijn werk doet.

sudo ufw app list , displaying available app profiles on UFW:

sudo ufw enable, to enable firewall

sudo ufw logging on

sudo ufw status verbose

sudo ufw allow 55815

sudo ufw deny 55815

sudo ufw allow 55815/tcp

sudo ufw deny 55815/tcp

sudo ufw allow ssh




### sources

https://www.softwaretestinghelp.com/firewall-security/

https://phoenixnap.com/kb/how-to-install-apache-web-server-on-ubuntu-18-04

https://www.journaldev.com/34113/opening-a-port-on-linux

https://linuxconfig.org/how-to-enable-disable-firewall-on-ubuntu-18-04-bionic-beaver-linux
