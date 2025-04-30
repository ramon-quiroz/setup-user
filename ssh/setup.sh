#!/bin/bash

echo -e "\nCREANDO LLAVES SSH\n"

# Crear la carpeta .ssh, asignar los permisos y accesos correspondientes
if [ ! -d "$home/.ssh" ]; then
	mkdir "$home/.ssh"
	chown $(id -u "$user"):$(id -g "$user") "$home/.ssh"
	chmod 700 "$home/.ssh"
fi

# Crear la llave ssh para el usuario
ssh-keygen -t rsa -b 4096 -m PEM -f $home/.ssh/id_rsa

# Asignar los permisos a las llaves ssh una vez creadas
chmod -R 600 $home/.ssh/*
chown -R $(id -u "$user"):$(id -g "$user") $home/.ssh/*

