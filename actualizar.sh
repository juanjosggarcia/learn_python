#!/bin/bash

set -e

FECHA=$(date +%Y-%m-%d_%H-%M-%S)

echo "================================="
echo " Actualizando notebooks"
echo "================================="

# 1. Guardar los notebooks actuales
echo "Creando copia de seguridad..."

if [ -d "notebook" ]; then
    cp -r notebook "notebook_old_$FECHA"
    echo "Copia creada: notebook_old_$FECHA"
fi

# 2. Eliminar los cambios locales de Git
echo "Descartando cambios locales..."

git restore notebook

# 3. Actualizar desde el repositorio
echo "Haciendo git pull..."

git pull

echo "================================="
echo " Actualización terminada"
echo "================================="