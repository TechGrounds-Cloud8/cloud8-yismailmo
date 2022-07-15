# Protocols
Introduction:


A network protocol is an agreement about how to communicate. There are protocols on every layer of the OSI stack.

The layer 4 protocols, TCP and UDP, are responsible for transporting internet packets. 

## Key terminolgy

UDP is a connectionless protocol meaning that it does not establish a connection and therefore UDP doesn't guarantee that all data is successfully transferred. 

With UDP, data is sent to any device that happens to be listening, but it doesn't care if some of it is lost along the way. 
This is one of the reasons why UDP is also known as the "fire-and-forget" protocol.

UDP is also significantly faster(but not guaranteed transfers) and it's used for live streaming and video games.


TCP is a connection-oriented protocol, meaning that it establishes a connection between two devices before transferring data, 

and maintains that connection throughout the transfer process(‘Three-way handshake’).

TCP is therefore more reliable (but also slower), typical application includes, E-mail and web browsing.

Ports is a logical construct that identifies a specific process or a type of network service. 

Port number is always associated with an IP address of a host and the type of transport protocol used for communication. 



Protocols in higher layers, like HTTPS and SSH, all have their own use cases. Most of these protocols have a default port number.


Requirements:
Your Linux Machine
Wireshark

## Exercise :
### Identify several other protocols and their associated OSI layer. Name at least one for each layer.

Layer 1(physical); Varieties of 802.11 Wi-Fi physical layers, FO Fiber optics

layer 2(Data link layer); ARP Address Resolution Protocol, DCAP Data Link Switching Client Access Protocol

Layer 3(Network layer); IP Internet Protocol, RIP Routing Information Protocol (v1 and v2)

Layer 4(Transport layer); TCP , UDP

Layer 5(session layer); RTCP RTP Control Protocol, SMPP Short Message Peer-to-Peer

Layer 6(Presentation); TLS Transport Layer Security, Network Data Representation (NDR)

Layer 7(Application); HTTP, HTTPS


### Figure out who determines what protocols we use and what is needed to introduce your own protocol.

Internet communication protocols are published by the Internet Engineering Task Force (IETF).
IETF develops open standards through open processes with one goal in mind: to make the Internet work better. 
With a large open international community of network designers, operators, vendors, and researchers.

So to introduce your own protocal, the process of creating one is much more formal and organized today.

This due to having an informal system where anyone could just write an RFC (Request for comment) would lead to chaos. 

Thus, Internet and TCP/IP standards are still called RFCs and IETF is still responsible for the creation of Internet standards(protocals). 

IETF’s working groups, overseen by the Internet Engineering Steering Group (IESG) and the Internet Architecture Board (IAB), develop new protocols and technologies continuously, and these developments are formalized in RFCs.


### Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.

Wireshark is a tool for collecting network traffic.


## Source
https://en.wikipedia.org/wiki/Port_(computer_networking)


https://www.freecodecamp.org/news/tcp-vs-udp/


https://www.rfc-editor.org/rfc/pdfrfc/rfc8613.txt.pdf


https://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model)


https://en.wikipedia.org/wiki/Communication_protocol


https://www.internetsociety.org/about-the-ietf/

http://www.tcpipguide.com/free/t_InternetStandardsandtheRequestForCommentRFCProcess.html

