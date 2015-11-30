#!/bin/bash

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

wget -P ~ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv ~/{,.}git-completion.bash

dotfiles=(".vimrc" ".bashrc" ".gitconfig" ".tmux.conf" ".zshrc" ".zshenv")

for i in "${dotfiles[@]}"
do
  ln -s ~/dotfiles/"$i" ~/"$i"
done
