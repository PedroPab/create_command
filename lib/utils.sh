#!/bin/bash

# Crea un enlace simbólico para el comando
create_symlink() {
  local dir="$1"
  local file="$2"
  local command="$3"

  if [[ ! -f "$dir/$file" ]]; then
    echo "Error: El archivo $file no existe en el directorio $dir."
    exit 1
  fi

  local target="/usr/local/bin/$command"

  # Crear el archivo ejecutable en /usr/local/bin
  sudo bash -c "cat <<EOF > $target
#!/bin/bash
cd \"$dir\" || exit 1
./\"$file\" \"\$@\"
EOF"

  sudo chmod +x "$target"
  echo "Comando '$command' creado con éxito."
}
