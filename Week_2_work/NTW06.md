# Subnetting


Introduction:

A subnet, or subnetwork, is a network inside a network. Subnets make networks more efficient. Through subnetting, network traffic can travel a shorter distance without passing through unnecessary routers to reach its destination.

subnetting narrows down the IP address to usage within a range of devices.

Network classes:

Class A network: Everything before the first period indicates the network, and everything after it specifies the device within that network. Using 203.0.113.112 as an example, the network is indicated by "203" and the device by "0.113.112."

Class B network: Everything before the second period indicates the network. Again using 203.0.113.112 as an example, "203.0" indicates the network and "113.112" indicates the device within that network.

Class C network: For Class C networks, everything before the third period indicates the network. Using the same example, "203.0.113" indicates the Class C network, and "112" indicates the device.

The problem would commonly occur when an organization required more than 254 host machines and therefore would no longer fall into class C but rather class B. This means that the organization would use a class B license even though they had far less than 65,535 hosts. Therefore if an organization only required 2,500 hosts, they would be wasting about 63,000 hosts by holding a class B license which would greatly decrease the availability of IPv4 addresses unnecessarily.



Subnet mask:

A subnet mask is like an IP address, but for only internal usage within a network. Routers use subnet masks to route data packets to the right place. Subnet masks are not indicated within data packets traversing the Internet — those packets only indicate the destination IP address, which a router will match with a subnet.



LAN:

Local area network is a network contained within a small geographic area, usually within the same building. Home WiFi networks and small business networks are common examples of LANs. 

LANs can also be fairly large, although if they take up multiple buildings, it is usually more accurate to classify them as wide area networks (WAN) or metropolitan area networks (MAN).

CIDR;
which stands for Classless Inter-Domain Routing, is an IP addressing scheme that improves the allocation of IP addresses. It replaces the old system based on classes A, B, and C. This scheme also helped greatly extend the life of IPv4 as well as slow the growth of routing tables.

CIDR is based on variable-length subnet masking (VLSM). This allows it to define prefixes of arbitrary lengths making it much more efficient than the old system. CIDR IP addresses are composed of two sets of numbers. The network address is written as a prefix, like you would see a normal IP address (e.g. 192.255.255.255). The second part is the suffix which indicates how many bits are in the entire address (e.g. /12). Putting it together, a CIDR IP address would look like the following:

192.255.255.255/12

NAT

A NAT gateway is a Network Address Translation (NAT) service. You can use a NAT gateway so that instances in a private subnet can connect to services outside your VPC but external services cannot initiate a connection with those instances.

When you create a NAT gateway, you specify one of the following connectivity types:

Public – (Default) Instances in private subnets can connect to the internet through a public NAT gateway, but cannot receive unsolicited inbound connections from the internet. You create a public NAT gateway in a public subnet and must associate an elastic IP address with the NAT gateway at creation. You route traffic from the NAT gateway to the internet gateway for the VPC. Alternatively, you can use a public NAT gateway to connect to other VPCs or your on-premises network. In this case, you route traffic from the NAT gateway through a transit gateway or a virtual private gateway.

Private – Instances in private subnets can connect to other VPCs or your on-premises network through a private NAT gateway. You can route traffic from the NAT gateway through a transit gateway or a virtual private gateway. You cannot associate an elastic IP address with a private NAT gateway. You can attach an internet gateway to a VPC with a private NAT gateway, but if you route traffic from the private NAT gateway to the internet gateway, the internet gateway drops the traffic.



Benodigdheden:
https://app.diagrams.net/
Een subnet calculator
### Opdracht:
 Maak een netwerkarchitectuur die voldoet aan de volgende eisen:


#### 1 private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.

I have created this subnet with ip (196.168.2.0/24) because there is no minimal host required.

#### 1 private subnet dat internet toegang heeft via een NAT gateway. 
#### Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT gateway).

This subnet will connect with the other private subnet but it will be on a different availability zone(another data centre) and it will have the same 
ip range (196.168.2.0/24) since there is no maximum requirement for hosts

#### 1 public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts kunnen plaatsen (de 5 hosts is exclusief de internet gateway).

So this public subnet will have an ip of 196.168.1.0 and it will have access to the public through an internet gateway.

#### Plaats de architectuur die je hebt gemaakt inclusief een korte uitleg in de Github repository die je met de learning coach hebt gedeeld.


#### challenges

alot of of information about subnetting to filter through, eventhough i had previous experience with AWS, it was still challenging to come up with the architecture of the three networks.


### Sources

https://www.cloudflare.com/learning/network-layer/what-is-a-subnet/

https://www.cloudflare.com/learning/network-layer/what-is-a-lan/

https://www.keycdn.com/support/what-is-cidr

https://www.nstec.com/is-internet-gateway-just-a-firewall/

https://www.ipaddressguide.com/cidr
