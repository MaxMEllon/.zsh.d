#!/bin/sh
ln -s .dotfiles/.zsh.d/.zshrc ~/
if [ ! -e ~/.zshenv ]; then
  touch ~/.zshenv
fi
git submodule update --init
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv" >> ~/.zshenv
ZSHRC_PATH=.dotfiles/.zsh.d
mkdir -p $ZSHRC_PATH/ip
curl "ifconfig.me/ip" > $ZSHRC_PATH/ip/ip_data.dat
curl "ifconfig.me/host" >> $ZSHRC_PATH/ip/ip_data.dat
IP=`head -1 ${ZSHRC_PATH}/ip/ip_data.dat | grep 1`

