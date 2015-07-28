#!/bin/sh
ZSHRC_PATH=~/.dotfiles/.zsh.d
echo $ZSHRC_PATH
ln -s .dotfiles/.zsh.d/.zshrc ~/
if [ ! -e ~/.zshenv ]; then
  touch ~/.zshenv
fi
cd $ZSHRC_PATH
git submodule update --init
echo "source ${ZSHRC_PATH}/package/zsh.d/zshenv" >> ~/.zshenv
mkdir -p $ZSHRC_PATH/ip
curl "ifconfig.me/ip" > $ZSHRC_PATH/ip/ip_data.dat
curl "ifconfig.me/host" >> $ZSHRC_PATH/ip/ip_data.dat
IP=`head -1 ${ZSHRC_PATH}/ip/ip_data.dat | grep 1`

