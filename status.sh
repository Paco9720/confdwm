#!/bin/bash

# Tags (escritorios) estáticos
TAGS="1 2 3 4 5 6 7 8 9"

while true; do
    # Hora y fecha
    DATE=$(date "+%Y-%m-%d %H:%M")

    # Mostrar tags + fecha en la barra
    STATUS="$TAGS | $DATE"

    # Actualizar la barra de DWM
    xsetroot -name "$STATUS"

    sleep 1
done

