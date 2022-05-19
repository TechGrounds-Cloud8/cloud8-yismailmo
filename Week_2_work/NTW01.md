## OSI Stack
### Introduction:
The Open Systems Interconnection model (OSI model) is a model primarily used for troubleshooting of telecommunication or computing systems.

## Key terminology: 
Protocol; set of rules used to determine how data is transmitted between different devices in the same network.

Host ; A host (can be computer, phone) will recognize its peer host at the remote network by its port number.


OSI model has 7 different layers, each layer is directly linked to the layer above and below if  a layer exists. When Data travels down the OSI model (from layer 7 to 1) then each layer adds additional information. This continues until the data reaches the last layer and then it is transmitted across the network. Once the other side (other devices) receives the data the process is reversed until the data travels to the 7th layer.
Therefore the OSI model is helpful when troubleshooting an IT issue, you can use the OSI model as a reference point, by taking a bottom-up or a top-down approach. 
### Here are the 7 layers and each layer has different protocols associated with it.


Layer 7: Application
is closest to the end-user. It means the OSI application layer allows users to interact with other software applications. 

By using API’s and resource sharing.
With the following protocol;SMTP, HTTP, FTP, POP3, SNMP

Layer 6: presentation
defines the form in which the data is to exchange between the two communicating entities. It also helps you to handle data compression and data encryption.
With the following protocol; MPEG, ASCH, SSL, TLS

Layer 5: Session
controls the dialogues between computers. It helps you to establish starting and terminating the connections between the local and remote application. Like Authentication(log-on or password validation), reconnection and managing sessions.

With the following protocol; NetBIOS, SAP


Layer 4: Transport
Manages packets ( a small segment of a larger message) size and resending of data if it was lost or corrupt(contains error).
With the following protocol; TCP, UDP

Layer 3: Network

To provide internetworking. To move packets from source to destination
With the following protocol; IPV5, IPV6, ICMP, IPSEC, ARP, MPLS.


Layer 3 devices include
1, Router, used for communication for inter and intra network-wide area networks (WAN’s).


2, Subnet mask,  is a 32-bit logical address that is used along with the IP address by the routers to determine the location of the destination host to route the packet data.

Layer 2: Data Link

Flow and error control by ensuring not sending more data than the network can handle.
It also supervises the physical addressing system called the MAC address for the networks and handles the access of the assorted network components to the physical medium.

Layer 2 devices include 

1, Layer-2 switches that forward the data to the next layer on the basis of the physical address (MAC address) of the machine). 

2, Bridges, to connect two LAN networks.

With the following protocol; RAPA, PPP, Frame Relay, ATM, Fiber Cable, etc.


Layer 1: Physical 

Responsible for transmitting data on the network.

With the following protocol; RS232, 100BaseTX, ISDN, 11.

layer 1 devices include hubs, repeaters & Ethernet cable connectors. 

In conclusion The bottom four layers (from physical to transport) are used for data transmission between the networks and the top three layers (session, presentation & application) are for data transmission between hosts.

## TCP/IP model:

An alternative to the OSI model is the TCP/IP model. The TCP/IP model describes the standard on which the internet was built, so it is a more realistic model. OSI is generally more practical for troubleshooting purposes because of its extra layers, even if it isn’t entirely accurate. 


Transmission control protocol (TCP) and Internet protocol (IP), a number of protocols that are used to make internet communication possible.

TCP/IP has 4 layers compared OSI model:

Layer 1: Application layer

Combiness the 1st and 3rd layers of OSI model.

Layer 2: Transport
The same as transport in OSI model.

Layer 3: Internet layer

Maps directly to the network layer of the OSI model.

Layer 4: Network access
Maps to the last two layers (data link and physical).

### Dealing with challenges
Understanding OSI model and TCP/IP model, because there is huge amount of information available about the topic, 

so I was comparing two or more sources in order to better understand the models.


### Exercise:
The OSI model and its uses.
The TCP/IP model and its uses.
## Sources
https://www.guru99.com/layers-of-osi-model.html#5
https://www.softwaretestinghelp.com/osi-model-layers/
https://www.imperva.com/learn/application-security/osi-model/
https://www.javatpoint.com/osi-vs-tcp-ip


