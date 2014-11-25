#!/bin/sh

cd
for p in .dotfiles/.zsh.d .dotfiles/.zsh.d/package/zsh.d
do
  repo `echo $p | sed -e "s/.dotfiles\///g"`
  git clone git@github.com:${GITHU_USER_NAME}/${repo}.git ${p}
done
ln -s .dotfiles/.zsh.d/.zshrc
if [ ! -e .zshenv ]; then
  touch .zshenv
fi
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv"
