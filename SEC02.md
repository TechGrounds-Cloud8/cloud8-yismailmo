
# Firewalls
Introductie:
Firewalls is software dat netwerkverkeer filtert. 

Een firewall kan dit verkeer filteren op protocol, poortnummer, bron en bestemming van een pakket. 

Meer geavanceerdere firewalls kunnen ook de inhoud inspecteren voor 

CentOS en REHL hebben een standaard firewall daemon (firewalld) geïnstalleerd. Voor Ubuntu is de standaard firewall ufw. Een oudere nog veel voorkomende firewall is iptables.
 
Firewalls kunnen stateful of stateless zijn. Stateful firewalls onthouden de verschillende states van vertrouwde actieve sessies. Hierbij hoeft een stateful firewall niet elke pakketje te scannen voor deze verbindingen.

In een cloud omgeving zal je firewalls veel tegenkomen als een van de vele verdedigingslinies tegen het publieke internet. 
Bestudeer:
De verschillende types firewall
stateful / stateless
hardware / software
Benodigdheden:
Je Linux machine
Je unieke poortnummer voor http-verkeer
Opdracht:
Installeer een webserver op je VM.
Bekijk de standaardpagina die met de webserver geïnstalleerd is.
Stel de firewall zo in dat je webverkeer blokkeert, maar wel ssh-verkeer toelaat.
Controleer of de firewall zijn werk doet.

