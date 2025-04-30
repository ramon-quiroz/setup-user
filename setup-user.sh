#!/bin/bash

# Agregar a la sesión las variables de entorno y funciones
source "/setup-user/env/setup.sh"
source "$setup/functions/buscar_palabra_archivo.sh"

# Validar si las variables de entorno existen
if [ -z "$user" ]; then
	exit 1
fi

# Lista y orden de los scripts a ejecutar segun el usuario loggeado
if [ $USER = "root" ]; then
	etapas=("update" "user" "profile")
else
	etapas=("user" "docker" "ssh" "samba" "profile")
fi

# Recorrido de la lista
for etapa in "${etapas[@]}"; do

	# Validar si ya se ejecutó previamente el script para no volverlo a ejecutar
	chklst=$(buscar_palabra_archivo "$etapa" "$checklist")
	if [ $? -eq 0 ]; then

		# Ejecutar el script y guardarlo en el checklist para no volverlo a ejecutar
		if bash "$setup/$etapa/setup.sh"; then
			if [ $USER != "root" ]; then
				echo $etapa >> $checklist
			fi
		fi
	fi
done


# Fin del proceso
if [ $USER = "root" ]; then
	ip_address=$(ip -o -4 addr show eth0 | awk '{print $4}' | cut -d '/' -f 1)
	echo -e "\nUSUARIO CREADO, POR FAVOR INICIA SESIÓN DESDE PUTTY CON TU NUEVO USER PARA CONTINUAR\n\n\tUsuario: $user\n\tContraseña: Temporal123\n\tIP: $ip_address\n\tPuerto: 22\n"
else
	echo -e "\nPROCESO FINALIZADO. REINICIA EL EQUIPO PARA FINALIZAR LA INSTALACION (sudo reboot)\n"
fi

