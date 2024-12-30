# create_command

Herramienta para crear comandos personalizados en Linux.

## Instalación

```bash
  git clone https://github.com/PedroPab/create_command
  cd create_command
  chmod +x install.sh
  ./install.sh
```

## Características

- Convierte un archivo ejecutable en un comando global.
- Simplifica la creación de utilidades accesibles desde cualquier lugar.

## Uso

```bash
create_command <archivo_principal> <nombre_comando> [directorio]
```

## Ejemplo

```bash
create_command -f script.sh -n my_command
```
