
# IP addresses

Is a label which is used to identify one or more devices on a computer network, such as the internet. 

It can be compared to a postal address. Devices using IP addresses use the internet protocol to communicate.


### Key terminology

IPv4 en IPv6 

IPv4

IPv4 only allows for 4.3 billion addresses, and we've almost used them all. To delay this, Network Address Translation (NAT) was created. Network Address Translation has a network share one public IP address and give every computer on the network a private IP address. Everyone living in the same house uses the same address, but mail can be meant for multiple different people living in the house.

IPv6

In IPv6, the address size was increased from 32 bits in IPv4 to 128 bits, thus providing up to 2128 (approximately 3.403×10^38) addresses. This is deemed sufficient for the foreseeable future.


#### Public en Private IPs

Certain IP addresses can be assigned freely on the local area network. Since they are not unique, they are not routed on the internet (private IPs). 

Private IPs; The addresses which can be freely assigned. In order to be routed, a private address needs to be translated into a public one.

private IPs consist of:
192.168.0.0 - 192.168.255.255
172.16.0.0 - 172.31.255.255
10.0.0.0 - 10.255.255.255

Public IPs; a unique IP address provided 


#### NAT
Network address translation
process of translating between private and public addresses. Routers and firewalls often also perform this task.

#### Statische en dynamische adressen

Static addressing means the same machine will always get the same IP address. 

Dynamic addresses, a device will get the next address which is not used. Dynamic addresses which are used need to be reviewed from time to time. 
If they are not renewed, they can be used for other devices.


Benodigdheden:
Je laptop
Je mobiel
Admin toegangsgegevens voor je router
### Opdracht:


#### Ontdek wat je publieke IP adres is van je laptop en mobiel op wifi. Zijn de adressen hetzelfde of niet? Leg uit waarom.

Both my laptop and mobile have the same public IP when i checked them both on whatismyip.com
because public IP address is assigned by my internet provider to my router which in turn assigns different internal(private) IP addresses to all devices in the network. 


#### Ontdek wat je privé IP adres is van je laptop en mobiel op wifi. Zijn de adressen hetzelfde of niet? Leg uit waarom.

Name	   | IP Address	|  MAC Address	
Mobile  |192.168.2.6 | DA:C3:64:CC:40:DF	5G

Name   |  IP address   |  MAC Address
Unknown	| 192.168.2.3  | 40:A3:CC:57:A9:3B	2.4G

They both have different private IP addresses because the DHCP in my router will assign private ip address to each device automatically.


#### Verander het privé IP adres van je mobiel naar dat van je laptop. Wat gebeurt er dan?
Probeer het privé IP adres van je mobiel te veranderen naar een adres buiten je netwerk. Wat gebeurt er dan?

Cannot change the private IP addresses.

Tip: vergeet niet je instellingen weer terug te zetten wanneer je klaar bent met de opdracht.

#### Challenges
Could not change my mobile/laptop private IP address because i was only able to click on DHCP on/off but i cannot change anything on the private IP addresses.



### Source

https://simple.wikipedia.org/wiki/IP_address

https://en.wikipedia.org/wiki/IP_address


https://mijnmodem.kpn/
