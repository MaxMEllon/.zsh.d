#!/bin/sh

mkdir ip
curl "ifconfig.me/ip" > ~/.dotfiles/.zsh.d/ip/ip_data.dat
curl "ifconfig.me/host" >> ~/.dotfiles/.zsh.d/ip/ip_data.dat

cd
github_user_name=MaxMEllon
local_path=(.dotfiles/.zsh.d .dotfiles/.zsh.d/package/zsh.d)
repo=(.zsh.d zsh.d)
count=(0 1)
for k in count
do
  git clone https://github.com/${github_user_name}/${repo[$k]}.git $local_path[$k]
done
ln -s .dotfiles/.zsh.d/.zshrc
if [ ! -e .zshenv ]; then
  touch .zshenv
fi
echo "source ~/.dotfiles/.zsh.d/package/zsh.d/zshenv" >> ~/.zshenv

