
# Firewalls

A firewall is a device or a combination of systems that supervises the flow of traffic between distinctive parts of the network. 

A firewall is used to guard and filters using the port numbers, protocals, source and destination of a pakket in the network against nasty people and prohibit their actions at predefined boundary levels.

For Example, a firewall always exists between a private network and the Internet which is a public network thus filters packets coming in and out.

Firewall and OSI Reference Model
A firewall system can work on five layers of the OSI model. But most of them run at only four layers i.e. data-link layer, network layer, transport layer, and application layers.

Firewall System contains;


1) Perimeter Router
The main reason for using it is to provide a link to a public networking system like the internet, or a distinctive organization. It performs the routing of data packets by following an appropriate routing protocol.

It also provisions the filtering of packets and addresses translations.

2) Firewall
As discussed earlier also its main task is to provisions distinctive levels of security and supervises traffic among each level. Most of the firewall exists near the router to provide security from external threats but sometimes present in the internal network also to protect from internal attacks.

#3) VPN
Its function is to provisions a secured connection among two machines or networks or a machine and a network. This consists of encryption, authentication, and, packet-reliability assurance. It provisions the secure remote access of the network, thereby connecting two WAN networks on the same platform while not being physically connected.

#4) IDS
Its function is to identify, preclude, investigate, and resolve unauthorized attacks. A hacker can attack the network in various ways. It can execute a DoS attack or an attack from the backside of the network through some unauthorized access. An IDS solution should be smart enough to deal with these types of attacks.

IDS solution is of two kinds, network-based and host-based. A network-based IDS solution should be skilled in such a way whenever an attack is spotted, can access the firewall system and after logging into it can configure an efficient filter that can restrict the unwanted traffic.

A host-based IDS solution is a kind of software that runs on a host device such as a laptop or server, which spots the threat against that device only. IDS solution should inspect network threats closely and report them timely and should take necessary actions against the attacks.


Firewall Categories
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



Een firewall kan dit verkeer filteren op protocol, poortnummer, bron en bestemming van een pakket. 

Meer geavanceerdere firewalls kunnen ook de inhoud inspecteren voor 

CentOS en REHL hebben een standaard firewall daemon (firewalld) geïnstalleerd. Voor Ubuntu is de standaard firewall ufw. Een oudere nog veel voorkomende firewall is iptables.
 
Firewalls kunnen stateful of stateless zijn. Stateful firewalls onthouden de verschillende states van vertrouwde actieve sessies. Hierbij hoeft een stateful firewall niet elke pakketje te scannen voor deze verbindingen.


In een cloud omgeving zal je firewalls veel tegenkomen als een van de vele verdedigingslinies tegen het publieke internet. 


Bestudeer:
De verschillende types firewall
stateful / stateless
hardware / software
### Benodigdheden:


Je Linux machine
Je unieke poortnummer voor http-verkeer

### Opdracht:
#### Installeer een webserver op je VM.


#### Bekijk de standaardpagina die met de webserver geïnstalleerd is.


#### Stel de firewall zo in dat je webverkeer blokkeert, maar wel ssh-verkeer toelaat.Controleer of de firewall zijn werk doet.

### sources

https://www.softwaretestinghelp.com/firewall-security/
