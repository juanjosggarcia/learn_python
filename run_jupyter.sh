#!/usr/bin/env bash

set -e

VENV_DIR=".venv"
REQUIREMENTS_FILE="requirements.txt"

KERNEL_NAME="python-example"
KERNEL_DISPLAY_NAME="Python de ejemplo"

echo "==> Comprobando requirements..."

if [[ ! -f "$REQUIREMENTS_FILE" ]]; then
    echo "ERROR: No se ha encontrado el fichero '$REQUIREMENTS_FILE'."
    echo ""
    echo "Asegúrate de ejecutar este script desde el directorio del proyecto."
    exit 1
fi

echo "==> Comprobando Python..."

if ! command -v python3 >/dev/null 2>&1; then
    echo "ERROR: Python 3 no está instalado."
    echo ""
    echo "Instálalo con: sudo apt install python3"
    exit 1
fi

PYTHON="$(command -v python3)"

echo "==> Python encontrado:"
"$PYTHON" --version

echo "==> Creando entorno virtual..."
"$PYTHON" -m venv "$VENV_DIR"

echo "==> Actualizando pip..."
"$VENV_DIR/bin/python" -m pip install --upgrade pip

echo "==> Instalando dependencias..."
"$VENV_DIR/bin/python" -m pip install -r "$REQUIREMENTS_FILE"


# echo "==> Registrando el kernel (lo registrar a nivel Global)..."
# "$VENV_DIR/bin/python" -m ipykernel install --user \
#     --name="$KERNEL_NAME" \
#     --display-name="$KERNEL_DISPLAY_NAME"

echo ""
echo "======================================"
echo " Instalación completada"
echo "======================================"
echo ""

echo "Ejecutando Jupyter Notebook"
echo ""
exec $VENV_DIR/bin/jupyter notebook --ServerApp.token=''


# echo "Ejecutando JupyterLab"
# echo ""
# exec $VENV_DIR/bin/jupyter lab --ServerApp.token=''