#!/bin/sh
ZSHRC_PATH=~/.dotfiles/.zsh.d
echo $ZSHRC_PATH
ln -s $ZSHRC_PATH/.zshrc ~/
if [ ! -e ~/.zshenv ]; then
  touch ~/.zshenv
fi
cd $ZSHRC_PATH
git clone https://github.com/b4b4r07/zplug ~/.zplug
