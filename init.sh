#!/bin/sh
ZSHRC_PATH=~/.dotfiles/.zsh.d
mkdir -p $ZSHRC_PATH/ip
curl "ifconfig.me/ip" > $ZSHRC_PATH/ip/ip_data.dat
curl "ifconfig.me/host" >> $ZSHRC_PATH/ip/ip_data.dat
cd $ZSHRC_PATH
git submodule update --init
ln -s .dotfiles/.zsh.d/.zshrc ~/
if [ ! -e ~/.zshenv ]; then
  touch ~/.zshenv
fi
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv" >> ~/.zshenv

