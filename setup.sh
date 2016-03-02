#!/bin/bash

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

wget -P ~ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv ~/{,.}git-completion.bash

git clone https://github.com/drmad/tmux-git.git ~/.tmux-git

dotfiles=(".vimrc" ".bashrc" ".gitconfig" ".tmux.conf" ".zshrc" ".zshenv")

for i in "${dotfiles[@]}"
do
  ln -s ~/dotfiles/"$i" ~/"$i"
done
