# SETUP-USER - Readme File

## Clonar repositorio

Primero que nada debemos bajar el repositorio desde github, debemos de asegurarnos de:

* Configurar las llave ssh previamente en nuestro usuario de github
* Asignar permisos de escritura al usuario github en el repositorio

```bash
# Configurar usuario de git en nuestro sistema local
git config --global user.email "tu-correo"
git config --global user.name "tu-nombre"

# Clonar el repositorio
git clone git@github.com:ramon-quiroz/setup-user.git
```

## Configurar un equipo por primera vez

#### Configurar los repositorios de Alpine Linux

Todos los comandos se deben ejecutar desde el `usuario root`.

Podemos utilizar los siguientes comandos:

```bash
apk add vim
vim /etc/apk/repositories
# Descomentar la línea que hace referencia al repositorio community
apk update && apk upgrade
```

#### Instalar Utilidades

```bash
apk add tmux
apk add git
apk add htop
```

#### Instalar SUDO

Instalamos sudo para darles el privilegio de ejecutar comandos como root a los usuarios.

```bash
apk add sudo
visudo
# Descomentar la línea: %wheel ALL=(ALL:ALL) ALL
```

#### Instalar DOCKER

```bash
apk add docker
apk add docker-compose
rc-update add docker
rc-update -a
rc-service docker start
```

#### Instalar SAMBA
```bash
apk add samba
rc-update add samba
rc-update -a
rc-service samba start
```

#### Instalar BASH
```bash
apk add bash
vim /etc/passwd
	# Modificar la terminal por default en el user root y el usuario deseado
```

#### Crear Marquesinas

```bash
apk add figlet
figlet "Hola Mundo"
```

#### Modificar Nombre del Host
```bash
setup-hostname "nombre-host"
```

## Configurando usuarios

Una vez teniendo instaladas las utilidades podemos configurar nuestros usuarios ejecutando `setup-user.sh desde el usuario root`.

**NOTA:** Cada que configuramos un nuevo usuario debemos eliminar el archivo `install_checklist.log`
