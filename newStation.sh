#!/bin/bash
verde="\033[0;32m"                                                                                                                                       
vermelho="\033[0;31m"
verde="\033[0;32m"#parmera

#pegando o nome da estação
echo -e "\e[1;32m station name \e[0m"
read station
echo $station.aco-connexion.org

##criando e editando o arquivo station
cp file.aco-connexion.org $station.aco-connexion.org
sed -i 's/file/'$station'/g' $station.aco-connexion.org

#conf/transport.BRA31LA
sed -i -e '$a'$station'.aco-connexion.org uucp:'$station'' transport.BRA31LA

#editando o /etc/bind/zones/aco-connexion.org
sed -i -e '50i\' -e ''$station'.aco-connexion.org        IN      A       104.248.253.98' aco-connexion.org
sed -i -e '80i\' -e ''$station'         TXT  "v=spf1 ip4:104.248.253.98 -all"' aco-connexion.org 

##Criando a estação VPN
pivpn -a -d 3650 nopass -n $station.aco.connexion.org

##Pegando o ip da vpn
cat /etc/openvpn/ccd/$station.aco.connexion.org | awk '{print $2}'

