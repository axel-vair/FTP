#!/bin/bash 

#Arrêt du système
service proftpd stop

#On supprime proftpd et toutes ses dépendances
apt autoremove -y --purge proftpd-*

#Même chose pour openssl
apt autoremove -y --purge openssl

#On supprime les utilisateurs et leurs dossiers
deluser -r Merry
deluser -r Pippin 
