# Network Devices
Introductie:
Er bestaat geen netwerk zonder netwerkapparatuur als je meer dan twee computers aan elkaar wilt schakelen. 

Een korte, en zeker niet complete, lijst van netwerkapparatuur volgt:
router
switch
repeaters
access point 


Bestudeer:
Netwerkapparaten
Het OSI model in relatie tot deze netwerkapparaten
Benodigdheden:
Je eigen netwerk
Admin toegangsgegevens voor je router
## Opdracht:
### Benoem en beschrijf de functies van veel voorkomend netwerkapparatuur

1.Switch zorgt ervoor dat computers met elkaar kunnen praten zonder "collision (botsing)want een switch verdeelt een netwerk van computers in "segmenten" om ervoor te zorgen dat geen collision tussen twee connecties optreden.

2.hub, doet hetzelfde als een switch maar stuurt telkens als een computer iets zegt, stuurt de hub het door naar ALLE ANDERE computers.Dit zorgt ervoor dat collision (botsing) plaatsvindt
3.NIC (Network Interface Card), oftewel je netwerkkaart. Strikt gezien valt het dus niet onder de noemer 'toestel',

4.Repeater is eigenlijk ook een hub (meestal met slechts 2 poorten, dit wordt gebruikt  om een computer te kunnen verbinden die op meer dan 100m afstand gelegen is.

5.Router:een Router, routeert op level 3 van het OSI model

6.DHCP, Dynamic Host Configuration Protocol (DHCP) is a network management protocol used on Internet Protocol (IP) networks for automatically assigning IP addresses and other communication parameters to devices connected to the network using a client–server architecture.





### De meeste routers hebben een overzicht van alle verbonden apparaten, vind deze lijst. 

Samsung phone, Galaxy tab, galaxy s9

IP Address
MAC Address
Interface


Samsung
192.168.2.185
xx:xx:xx:xx:xx:xx
2.4G
Manage Internet Access


Galaxy-Tab-A
192.168.2.2
xx:xx:xx:xx:xx:xx
2.4G
Manage Internet Access


Galaxy-S9-van
192.168.2.15
xxxxxxxxxxxxxx
2.4G
Manage Internet Access




Welke andere informatie heeft de router over aangesloten apparatuur?

 


Ook telefoon  (landline) connectie, DHCP, DNS assigments, en Logs of the router.


Waar staat je DHCP server op jouw netwerk? Wat zijn de configuraties hiervan?

Een DHCP server zorgt ervoor dat een apparaat met de router is verbonden een uniek ip adres automatisch krijgt, dus DHCP staat in de router.
Dit is hoe ik de DHCP via chrome os developer shell heb gevonden: IP config 

in crosh> (chrome developer shell)  deze command , network_diag --dhcp


DHCP Lease file /var/lib/dhcpcd/dhcpcd-wifi_any_416972706f72745f467265655f57694669_managed_none.lease
  Lease file age: 22375071
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 10.41.43.57
  Message type: ACK
  Lease Time: 3576 seconds (22371495 seconds ago)
  Netmask: 255.255.0.0
  Domain name servers: 77.241.235.248,77.241.235.249
  
  
DHCP Lease file /var/lib/dhcpcd/dhcpcd-wifi_any_486f6c69646179496e6e_managed_none.lease
  Lease file age: 22037530
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 10.0.202.53
  Message type: ACK
  Lease Time: 282864 seconds (21754666 seconds ago)
  Netmask: 255.0.0.0
  Domain name servers: 10.0.0.1
  Domain name: localdomain
  
  
DHCP Lease file /var/lib/dhcpcd/dhcpcd-wifi_any_544d4e4c2d343945434131_managed_psk.lease
  Lease file age: 9844450
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 192.168.1.147
  Server address: 192.168.1.1
  Message type: ACK
  Lease Time: 86400 seconds (9758050 seconds ago)
  Renew Time: 43200 seconds (9801250 seconds ago)
  Rebinding Time: 75600 seconds (9768850 seconds ago)
  Netmask: 255.255.255.0
  Domain name: home
  Domain name servers: 192.168.1.1
  
  
DHCP Lease file /var/lib/dhcpcd/dhcpcd-wifi_any_56525639353137303731384630_managed_psk.lease
  Lease file age: 11036333
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 192.168.2.35
  Message type: ACK
  Lease Time: 86400 seconds (10949933 seconds ago)
  Netmask: 255.255.255.0
  Domain name servers: 192.168.2.254
  Domain name: home
  Renew Time: 43200 seconds (10993133 seconds ago)
  Rebinding Time: 75600 seconds (10960733 seconds ago)
  
  
  
DHCP Lease file /var/lib/dhcpcd/dhcpcd-wifi_any_5769466920696e20646520747265696e_managed_none.lease
  Lease file age: 22387859
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 10.87.0.66
  Message type: ACK
  Netmask: 255.255.252.0
  Domain name servers: 10.87.0.1,208.67.220.220
  Domain name: portal.nstrein.ns.nl
  Lease Time: 3600 seconds (22384259 seconds ago)
  
  
  
DHCP Lease file /var/lib/dhcpcd/wifi_any_544d4e4c2d343945434131_managed_psk.lease
  Lease file age: 429025
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 192.168.1.147
  Server address: 192.168.1.1
  Message type: ACK
  Lease Time: 86400 seconds (342625 seconds ago)
  Renew Time: 40002 seconds (389023 seconds ago)
  Rebinding Time: 72402 seconds (356623 seconds ago)
  Netmask: 255.255.255.0
  Domain name: home
  Domain name servers: 192.168.1.1
  
  
DHCP Lease file /var/lib/dhcpcd/wifi_any_56525639353137303731384630_managed_psk.lease
  Lease file age: 122186
  Client MAC address: a4:97:b1:44:c4:af
  Leased address: 192.168.2.36
  Message type: ACK
  Lease Time: 86400 seconds (35786 seconds ago)
  Netmask: 255.255.255.0
  Domain name servers: 192.168.2.254
  Domain name: home
  Renew Time: 43200 seconds (78986 seconds ago)
  Rebinding Time: 75600 seconds (46586 seconds ago)
  
  
  ### challenges
figure out where DHCP is located from my router and from chrome developer shell. but eventually i found it my router after log in (moden.kpn)


### Source
https://www.infoblox.com/glossary/dhcp-server/


https://www.google.com/search?q=command+prompt+chromebook+ipconfig

https://forum.kpn.com/internet-9/hoe-kan-ik-inloggen-op-de-experia-box-469617

https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol
