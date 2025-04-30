#!/bin/bash

echo -e "\nASIGNAR PERMISOS EN DOCCKER\n"

echo -e "\t- Asignando permisos para: $user"

# Agregar al usuario al grupo de docker para su correcta ejecución.
sudo addgroup $user docker

