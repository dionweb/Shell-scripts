#!/usr/bin/env sh
tracker daemon -t
cd ~/.config/autostart
cp -v /etc/xdg/autostart/tracker-*.desktop ./

for FILE in tracker-*.desktop; 
do 
    echo Hidden=true >> $FILE; 
done

rm -rf ~/.cache/tracker ~/.local/share/tracker
