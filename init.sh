#!/bin/sh
ln -s .dotfiles/.zsh.d/.zshrc ~/
if [ ! -e ~/.zshenv ]; then
  touch ~/.zshenv
fi
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv" >> ~/.zshenv
ZSHRC_PATH=~/.dotfiles/.zsh.d
mkdir -p $ZSHRC_PATH/ip
curl "ifconfig.me/ip" > $ZSHRC_PATH/ip/ip_data.dat
curl "ifconfig.me/host" >> $ZSHRC_PATH/ip/ip_data.dat
IP=`head -1 ~/.dotfiles/.zsh.d/ip/ip_data.dat | grep 1`
cd $ZSHRC_PATH
git submodule update --init

