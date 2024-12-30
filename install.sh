#!/bin/bash

# Instalar archivos en ubicaciones estándar
echo "Instalando create_command..."

sudo mkdir -p /usr/local/lib/create_command
sudo cp -r lib/* /usr/local/lib/create_command/

sudo cp bin/create_command /usr/local/bin/
sudo chmod +x /usr/local/bin/create_command

echo "Instalación completa. Prueba 'create_command --help'."
