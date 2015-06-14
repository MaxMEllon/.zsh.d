#!/bin/sh
ZSHRC_PATH=~/.dotfiles/.zsh.d
mkdir $ZSHRC_PATH
curl "ifconfig.me/ip" > $ZSHRC_PATH/ip/ip_data.dat
curl "ifconfig.me/host" >> $ZSHRC_PATH/ip/ip_data.dat
cd $ZSHRC_PATH
git submodule update --init
cd
ln -s .dotfiles/.zsh.d/.zshrc
if [ ! -e .zshenv ]; then
  touch .zshenv
fi
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv" >> ~/.zshenv

