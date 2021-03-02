#!/usr/bin/env sh

# Sript to clean Arch systems 

pkgCache=$(du -sh /var/cache/pacman/pkg/ | cut -f1)         # Get the size of pkg cache without path.
homeCache=$(du -sh ~/.cache/ | cut -f1)                     # Get the size of home cache without path.
numOfUnused=$(pacman -Qtdq | wc -l)                         # Get the number of unused packages.
numOfPackages=$(ls /var/cache/pacman/pkg/ | wc -l)          # Get the number of packages.

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

echo "$STR"
echo -e "\e[1mStep 1: Clean pkg cache \e[0m"

echo "$STR"

echo -e "The size of packages is \e[1m$pkgCache\e[0m".

while true
do
 read -r -p "Do you want to delete packages? [Y/n]" input
 
 case $input in
     [yY][eE][sS]|[yY])
 echo "$STR"
 echo "Ok, but i need your permission!"
 yes | sudo pacman -Scc &> /dev/null
 echo "$STR"
 echo -e "${GREEN}Done!${NOCOLOR}"
 break
 ;;
     [nN][oO]|[nN])
 break
        ;;
     *)
 echo -e "${RED}Invalid input.${NOCOLOR}"
 echo "$STR"
 ;;
 esac
done

echo "$STR"
echo -e "\e[1mStep 2: Remove unused packages \e[0m"

echo "$STR"

echo -e "You have \e[1m$numOfUnused\e[0m unused packages."

if [ $numOfUnused -eq 0 ]
then
    echo "No further action is needed."
else
    while true
    do
     read -r -p "Do you want to delete unused packages? [Y/n]" input
    
     case $input in
        [yY][eE][sS]|[yY])
     yes | sudo pacman -R $(pacman -Qtdq) &> /dev/null
     echo "$STR"
     echo -e "${GREEN}Done!${NOCOLOR}"
     break
     ;;
         [nN][oO]|[nN])
     echo "No problem, Cya!"
     break
             ;;
         *)
     echo -e "${RED}Invalid input.${NOCOLOR}"
     echo "$STR"
     ;;
     esac
    done
fi

echo "$STR"
echo -e "\e[1mStep 3: Clean Home cache \e[0m"

echo "$STR"

echo -e "The size of Home cache is \e[1m$homeCache\e[0m".

while true
do
 read -r -p "Do you want to clean? [Y/n]" input
 
 case $input in
     [yY][eE][sS]|[yY])
 rm -rf ~/.cache/*
 echo "$STR"
 echo -e "${GREEN}Done!${NOCOLOR}"
 echo "$STR"
 break
 ;;
     [nN][oO]|[nN])
 echo "$STR"
 echo -e "${GREEN}Bye!${NOCOLOR}"
 echo "$STR"
 break
        ;;
     *)
 echo -e "${RED}Invalid input.${NOCOLOR}"
 echo "$STR"
 ;;
 esac
done
