#!/bin/bash

echo -e "\nCONFIGURANDO SAMBA\n"

echo -e "\t- Configurando samba para $user"

# Agragar el user a samba
sudo smbpasswd -a $user

# Modificar el archivo de configuracion de samba
sudo bash -c 'cat "/setup-user/samba/smb.conf" >> "/etc/samba/smb.conf"'
sudo sed -i "s/my_user/$user/gi" "/etc/samba/smb.conf"

# Crear la carpeta winshare
mkdir "$home/winshare"
sudo chown $(id -u "$user"):wheel "$home/winshare"

echo -e "\t- Samba se ha configurado con éxito :)\n"
echo -e "\t- No olvides configurar tu unidad de red en Windows"

