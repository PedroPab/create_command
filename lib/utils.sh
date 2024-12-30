#!/bin/bash

# Crea un enlace simbólico o script ejecutable en /usr/local/bin
create_symlink() {
  local dir="$1"
  local file="$2"
  local command="$3"
  local target="/usr/local/bin/$command"

  echo "Creando el comando '$command'..."

  # Crear el archivo ejecutable
  cat <<EOF | sudo tee "$target" >/dev/null
#!/bin/bash
cd "$dir" || exit 1
./$file "\$@"
EOF

  # Asegurarse de que sea ejecutable
  sudo chmod +x "$target"

  echo "El comando '$command' ha sido creado con éxito."
  echo "Ahora puedes usar '$command' desde cualquier lugar para ejecutar el programa."
}
