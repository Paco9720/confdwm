#!/bin/bash

# Script para configurar DWM en Tumbleweed
# Ejecutar como usuario normal

set -e

echo "==> Instalando dependencias..."
sudo zypper install -y git gcc make libX11-devel libXft-devel libXinerama-devel xdotool rofi pamixer brightnessctl opi picom

echo "==> Creando directorios de configuración..."
mkdir -p ~/.config/sxhkd
mkdir -p ~/dwm_build

echo "==> Copiando archivos de configuración..."
# Copia tus archivos locales a ~/.config o al directorio de build
cp ./config.h ~/dwm_build/
cp ./sxhkdrc ~/.config/sxhkd/
cp ./dwmstatus.sh ~/
chmod +x ~/dwmstatus.sh

echo "==> Configurando .xinitrc..."
cat > ~/.xinitrc <<EOF
#!/bin/sh
pgrep -x sxhkd >/dev/null || sxhkd &
~/.dwmstatus.sh &
exec dwm
EOF
chmod +x ~/.xinitrc

echo "==> Instalación y configuración completadas."
echo "Para iniciar DWM, ejecuta: startx"

