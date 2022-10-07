#!/bin/bash

#On installe proftpd et openssl, on oublie pas le - entre l'étoile et le software... sinon cela ne s'installe pas
apt-get -y install proftpd-*
apt-get -y install openssl
	

#On crée le dossier SSL
mkdir /etc/proftpd/ssl

#On remplace les fichiers de config de base qui sont dans /etc/proftpd/ par des fichiers déjà modifiés dispo dans le repo github qu'on a cloné
cp modules.conf /etc/proftpd/modules.conf
cp proftpd.conf /etc/proftpd/proftpd.conf
cp tls.conf /etc/proftpd/tls.conf

#On créé notre clé + certificat puis on fait un echo pour remplir les informations demandées
echo -e "\nFR\nPACA\nMarseille\nLaPlateforme\nIT\n\n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem

#Création des deux users avec echo pour remplir les infos, on force la majuscule
echo -e "kalimac\nkalimac\nMerryChristmas\n\n\n\n\no\n" | adduser Merry  --force-badname
echo -e "secondbreakfast\nsecondbreakfast\nPippinLePinpin\n\n\n\n\no\n" | adduser Pippin  --force-badname

#On redémarre proftpd pour prendre en charge les modifications
service proftpd restart