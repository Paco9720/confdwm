#!/usr/bin/env bash
# Configurador de Openbox + utilidades para openSUSE
# Autor: ChatGPT
# Versión: 1.0

set -e

echo "[+] Instalando paquetes básicos..."
sudo zypper install -y openbox alacritty rofi polybar picom zip tar unrar patterns-devel-base-devel_basis

echo "[+] Creando directorios de configuración..."
mkdir -p ~/.config/{openbox,polybar,rofi,picom}

echo "[+] Copiando archivos de configuración si existen en el directorio actual..."
# Archivos esperados en el mismo directorio que este script
[ -f config.ini ] && cp -f config.ini ~/.config/polybar/
[ -f toggle.sh ] && cp -f toggle.sh ~/.config/polybar/
[ -f config.rasi ] && cp -f config.rasi ~/.config/rofi/
[ -f picom.conf ] && cp -f picom.conf ~/.config/picom/

echo "[+] Creando configuración básica de atajos en Openbox..."
RC_XML=~/.config/openbox/rc.xml

cat > "$RC_XML" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<openbox_config>
  <keyboard>
    <!-- Abrir Alacritty con Super+Enter -->
    <keybind key="W-Return">
      <action name="Execute">
        <command>alacritty</command>
      </action>
    </keybind>

    <!-- Abrir Rofi con Super+R -->
    <keybind key="W-space">
      <action name="Execute">
        <command>rofi -show drun</command>
      </action>
    </keybind>
  </keyboard>
</openbox_config>
EOF

echo "[+] Creando .xinitrc para iniciar Openbox + Picom..."
cat > ~/.xinitrc << 'EOF'
#!/bin/sh
# Iniciar compositor
picom --config ~/.config/picom/picom.conf &

# Iniciar Openbox
exec openbox-session
EOF
chmod +x ~/.xinitrc

echo "[+] Configuración completada."
echo "Puedes iniciar tu sesión con: startx"

