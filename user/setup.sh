#!/bin/bash

if ! id "$user" > /dev/null 2>&1; then
	# Agregar usuario y asignarle una contraseña temporal
	adduser -D $user && echo "$user:Temporal123" | chpasswd

	# Agregar el usuario al grupo de administradores
	addgroup $user wheel
else
	# Modificar la contraseña del usuario cuando se haya loggeado
	if [ $USER != "root" ]; then
		passwd
	fi
fi

