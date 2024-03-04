#!/bin/bash
verde="\033[0;32m"                                                                                                                                       
vermelho="\033[0;31m"
verde="\033[0;32m"#parmera

#pegando o nome da estação
echo "station name"
read station
echo $station.aco-connexion.org

##criar chave openvpn 
 #pivpn -a -n $station.aco-connexion.org

##criando e editando o arquivo station
cp file.aco-connexion.org $station.aco.connexion.org
sed -i 's/file/'$station'/g' $station.aco.connexion.org

#conf/transport.BRA31LA

sed -i -e '$a'$station'.aco-connexion.org uucp:'$station'' transport.BRA31LA


##editando o /etc/bind/zones/aco-connexion.org

sed -i '51s/$/'$station'.aco-connexion.org       IN      A       104.248.253.98/' aco-connexion.org

sed -i '81s/$/'$station'         TXT  "v=spf1 ip4:104.248.253.98 -all"/' aco-connexion.org



