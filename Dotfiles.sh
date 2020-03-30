#!/usr/bin/env sh
echo "Download .dotfiles..."

git clone --bare https://github.com/dionweb/Dotfiles $HOME/.dotfiles
function dotfile {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p .config-backup
dotfile checkout

if [ $? = 0 ]; then
  echo "Download completed!";
  else
    echo "Backup existing .dotfiles";
    dotfile checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

dotfile checkout
dotfile config status.showUntrackedFiles no