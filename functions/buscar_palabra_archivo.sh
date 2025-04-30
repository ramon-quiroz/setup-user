#!/bin/bash

# Función para validar si una palabra existe dentro de un archivo dado

buscar_palabra_archivo() {
	#Verificar si se proporcionan los argumentos necesarios
	if [ $# -ne 2 ]; then
		echo "Uso: buscar_palabra_archivo <palabra> <archivo>"
		return 0
	fi

	local palabra="$1"
	local archivo="$2"

	# Verificar si el archivo existe
	if [ ! -f "$archivo" ]; then
		echo "El archivo '$archivo' no existe"
		return 0
	fi

	# Buscar la etapa en el archivo
	if grep -q "$palabra" "$archivo"; then
		return 1
	else
		return 0
	fi
}

