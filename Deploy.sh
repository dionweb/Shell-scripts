#!/usr/bin/env sh
mainInfo(){
    read -p "Github username: " username
    read -p "Repository name: " repo
    read -p "Commit message: " commit
    echo "# $repo" >> README.md
}

gitCommands(){
    git init
    git add .
    git commit -m "$commit"
    git remote add origin https://github.com/$username/$repo.git
    git push -u origin master
}

deploy(){
    mainInfo
    gitCommands
}

menu() {
    clear
    echo "┌───────────────────────────────────────┐"
    echo "│  ≡  GitHub Deployment        -  +  x  │"
    echo "├───────────────────────────────────────┤"
    echo "│  1. Deploy                            │"
    echo "│                                       │"
    echo "│  2. Deploy (With markdown generator)  │"
    echo "│                                       │"
    echo "│  3. Exit                              │"
    echo "└───────────────────────────────────────┘"
    echo "                                           "
}

options(){
    local option
    read -p "Option 1-3: " option
    case $option in
    	1) deploy ;;
    	2) deployMDGen ;;
    	3) exit 1;;
    	*) echo -e "Invalid input" && sleep 1
    esac
}
                                           
while true 
do
    menu
    options
done