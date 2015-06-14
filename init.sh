#!/bin/sh

mkdir ip
curl "ifconfig.me/ip" > ~/.dotfiles/.zsh.d/ip/ip_data.dat
curl "ifconfig.me/host" >> ~/.dotfiles/.zsh.d/ip/ip_data.dat

git submodule update --init
cd
ln -s .dotfiles/.zsh.d/.zshrc
if [ ! -e .zshenv ]; then
  touch .zshenv
fi
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv" >> ~/.zshenv

