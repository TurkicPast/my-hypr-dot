#!/bin/bash

# Duvar kağıtlarının olduğu klasör
DIR="$HOME/.config/hypr/wallpapers"

# Rofi ile resimleri listele (Sadece isimleri gör)
CHOICE=$(ls "$DIR" | rofi -dmenu -p "🖼️ Wallpapers")

# Eğer bir seçim yapıldıysa işlemi başlat
if [ -n "$CHOICE" ]; then
    swww img "$DIR/$CHOICE" \
    --transition-type grow \
    --transition-fps 60 \
    --transition-duration 1 \
    --transition-pos 0.85,0.97
fi

#o make the script work, you must run chmod +x ~/.config/hypr/scripts/wallpaper-picker.sh to give it execution permission. Also, make sure to create the ~/.config/hypr/wallpapers directory and toss your wallpapers in there so you can actually pick them!
