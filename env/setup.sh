#!/bin/bash

if [ $USER = "root" ]; then
	echo -e "\nCREAR USUARIO\n"

	# Preguntar el nombre de usuario para agregarlo a las variables de entorno
	read -p "Ingresa el nombre de usuario a configurar: " my_user
else
	export my_user=$USER
fi

# Crear las variables de entorno
export user=$my_user
export home="/home/$my_user"
export script_dir=$(dirname "$(realpath "$0")")
export setup="$script_dir/setup-user"
export checklist="$setup/install_checklist.log"

# Crear el archivo checklist en caso de que no exista
if ! [ -f "$checklist" ]; then
	touch "$checklist"
	chmod 777 "$checklist"
fi
