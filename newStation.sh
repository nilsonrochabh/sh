#!/bin/bash
verde="\033[0;32m"                                                                                                                                       
vermelho="\033[0;31m"
verde="\033[0;32m"#parmera

#pegando o nome da estação
echo -e "\e[1;32m station name \e[0m"
read station
echo $station.aco-connexion.org

##criando e editando o arquivo station
cp stations/file.aco-connexion.org $station.aco-connexion.org
sed -i 's/file/'$station'/g' $station.aco-connexion.org

#conf/transport.BRA31LA
sed -i -e '$a'$station'.aco-connexion.org uucp:'$station'' transport.BRA31LA

##Criando a estação VPN
pivpn -a -d 3650 nopass -n $station.aco.connexion.org

##Pegando o ip da vpn
cat /etc/openvpn/ccd/$station.aco.connexion.org | awk '{print $2}' > ip

##Editando o aquivo uucp
sed -i -e '$a''system B0DE-x' uucp/sys.hermes
sed -i -e '$a''alias '$station'' uucp/sys.hermes
sed -i -e '$a''address '$ip'' uucp/sys.hermes

#editando o /etc/bind/zones/aco-connexion.org
sed -i -e '50i\' -e ''$station'.aco-connexion.org        IN      A       104.248.253.98' zones/aco-connexion.org
sed -i -e '80i\' -e ''$station'         TXT  "v=spf1 ip4:104.248.253.98 -all"' zones/aco-connexion.org 
#cp /etc/bind/zones/aco-connexion.org /etc/bind/zones/aco-connexion.org.old
#cp zones/aco-connexion.org /etc/bind/zones/
#service named restart