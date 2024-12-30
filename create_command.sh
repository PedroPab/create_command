#!/bin/bash

# Función para mostrar ayuda
function show_help() {
  echo "Uso: $0 [-d directorio] [-f archivo] [-n comando]"
  echo "  -d directorio : Ubicación de la carpeta del programa (por defecto, el directorio actual del usuario)."
  echo "  -f archivo    : Nombre del archivo principal del programa (obligatorio)."
  echo "  -n comando    : Nombre del comando que quieres crear (obligatorio)."
  exit 1
}

# Valores predeterminados
DIRECTORIO="$PWD"

# Parsear argumentos
while getopts "d:f:n:h" opt; do
  case "$opt" in
  d) DIRECTORIO="$OPTARG" ;;
  f) ARCHIVO="$OPTARG" ;;
  n) COMANDO="$OPTARG" ;;
  h) show_help ;;
  *) show_help ;;
  esac
done

# Validar que el archivo principal y el nombre del comando sean proporcionados
if [[ -z "$ARCHIVO" || -z "$COMANDO" ]]; then
  echo "Error: El archivo principal (-f) y el nombre del comando (-n) son obligatorios."
  show_help
fi

# Validar que el directorio exista
if [[ ! -d "$DIRECTORIO" ]]; then
  echo "Error: El directorio '$DIRECTORIO' no existe."
  exit 1
fi

# Validar que el archivo exista en el directorio
if [[ ! -f "$DIRECTORIO/$ARCHIVO" ]]; then
  echo "Error: El archivo '$ARCHIVO' no existe en el directorio '$DIRECTORIO'."
  exit 1
fi

# Crear el enlace simbólico o script ejecutable en /usr/local/bin
DESTINO="/usr/local/bin/$COMANDO"

echo "Creando el comando '$COMANDO'..."

# Crear el archivo ejecutable
cat <<EOF | sudo tee "$DESTINO" >/dev/null
#!/bin/bash
cd "$DIRECTORIO" || exit 1
./$ARCHIVO "\$@"
EOF

# Asegurarse de que sea ejecutable
sudo chmod +x "$DESTINO"

echo "El comando '$COMANDO' ha sido creado con éxito."
echo "Ahora puedes usar '$COMANDO' desde cualquier lugar para ejecutar el programa."
