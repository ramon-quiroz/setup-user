#!/bin/bash

echo -e "\nPERSONALIZANDO USUARIO\n"

# Lista de archivos que se van a copiar a la carpeta del usuario
archivos=(".bash_profile" ".bash_prompt" ".bash_aliases")

# Copiar los archivos a la carpeta del usuario modificando sus permisos y accesos
for archivo in "${archivos[@]}"; do
	echo -e "\t- Copiando: $archivo"
	cp "$setup/profile/$archivo" "$home/$archivo"
	chown $(id -u "$user"):$(id -g "$user") "$home/$archivo"
	chmod 600 "$home/$archivo"
done

# Copiar el archivo que servirá como pantalla inicial
echo -e "\t- Copiando: motd"
if [ $USER = "root" ]; then
	cp "$setup/profile/motd_inicial_user" "/etc/motd"
	chmod 644 /etc/motd
else
	sudo cp "$setup/profile/motd_final_user" "/etc/motd"
	sudo chmod 644 /etc/motd
fi

