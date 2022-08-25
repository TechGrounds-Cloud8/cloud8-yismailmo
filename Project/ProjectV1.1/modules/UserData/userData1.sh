#!/bin/bash

sudo su

apt update

apt install apache2 -y

systemctl enable apache2

echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/demo.html

systemctl restart apache2
