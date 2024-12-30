#!/usr/bin/env bats

setup() {
  # Crear un directorio temporal para pruebas
  mkdir -p test_env
  echo "#!/bin/bash" >test_env/test_script.sh
  echo "echo 'Test Script Ejecutado'" >>test_env/test_script.sh
  chmod +x test_env/test_script.sh
}

teardown() {
  # Limpiar los archivos creados
  rm -rf test_env /usr/local/bin/test_command
}

@test "Crea un comando exitosamente" {
  ../bin/create_command test_env/test_script.sh test_command test_env
  run test_command
  [ "$status" -eq 0 ]
  [ "$output" = "Test Script Ejecutado" ]
}
