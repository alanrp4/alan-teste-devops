#!/bin/bash

##############################################################
#                                                            #
# Nome: instalar.sh                                          #
#                                                            #
# Autor: Alan Rodrigues (alanr1988@gmail.com)                #
#                                                            #
# Descrição:                                                 #
# Passo1) Configurar ip fixo ubuntu 18.04 via netplan        #
#                                                            #
# Passo 2) Criar um usuario ssh e desativar o acesso ssh do  #
# usuário root.                                              #
#                                                            #
# Passo3) Instalar servidor web nginx, php7.3 baixar         #
# código e realizar o deploy da aplicação de perguntas       #
#                                                            #
# Exemplo de uso: bash instalar.sh                           #
#                                                            #
##############################################################
##### #Variaveis ######
username="user1" #Definir nome do usuário que será adicionaro no passo 2


####1) Função para criar ip fixo e desabilitar DHCP ####

staticip=`more cdir-config | grep staticip | awk -F= '{print $2}'`
gatewayip=`more cdir-config | grep gatewayip | awk -F= '{print $2}'`
nameserversip=`more cdir-config | grep nameserversip | awk -F= '{print $2}'`
eth_name=`more cdir-config | grep eth_name | awk -F= '{print $2}'`

echo
cat > /etc/netplan/*.yaml <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
   $eth_name:
      dhcp4: no
      dhcp6: no
      addresses: [$staticip]
      gateway4: $gatewayip
      nameservers:
          addresses: [$nameserversip]
EOF

sudo netplan apply

####2) Função para criar usuário ssh e desativar acesso do usuário root ####
#Adicionr usuario
useradd -m -p 123456 $username
mkdir /home/$username/.ssh/
cat ./config/id_rsa.pub > /home/$username/.ssh/authorized_keys;

#Ajustar permissão na chave ssh
chown $username:$username /home/$username/.ssh/ -R
chmod 600 /home/$username/.ssh/* ; chmod 700 /home/$username/.ssh/

#Adicionar usuário ao grupo root
gpasswd -a $username sudo

#Desativar acesso ssh usuário root
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd
                    
####3) #Instalar nginx latest ####
sudo apt update ; sudo apt install nginx -y

#Instalar php v7.3
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php  -y
apt update -y
sudo apt install php7.3 php7.3-fpm -y

#Ajustar configuração do nginx, para acsso a pagina de perguntas
cp ./config/default /etc/nginx/sites-available

#Clonar do github aplicação de perguntas
git clone https://github.com/luishscosta/teste-devops.git

#Deploy aplicação no servidor web
mv teste-devops /var/www/html/perguntas

#Ajustar permissões no servidor web
sudo chown www-data:www-data /var/www/html/perguntas -R
sudo find /var/www/html/perguntas -type d -exec chmod 755 {} \;
sudo find /var/www/html/perguntas -type f -exec chmod 644 {} \;

#Reiniciar servidor web
sudo service nginx restart

