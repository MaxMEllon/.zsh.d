#======================================================================
# plugin
#======================================================================

# incr
# 強力すぎて邪魔だったので一時無効
# source ~/.dotfiles/.zsh.d/plugin/incr-0.2.zsh/incr-0.2.zsh

# cd-gitroot
fpath=(~/.dotfiles/.zsh.d/plugin/cd-gitroot(N-/) $fpath)
autoload -Uz cd-gitroot
alias cdu='cd-gitroot'

# k
GIT_VER=`git --version | awk -F ' ' '{ print $3 }' | cut -c1`
if [ $GIT_VER -ge 2 ]; then
  source ~/.dotfiles/.zsh.d/plugin/k/k.sh
  K="ENABLE"
fi

# z
source ~/.dotfiles/.zsh.d/plugin/z/z.sh

# zsh-syntax
# なんかこうしないとうまくいかない
cd ~/.dotfiles/.zsh.d/plugin/zsh-syntax-highlighting
source zsh-syntax-highlighting.zsh
cd -

#======================================================================
# config
#======================================================================

source ~/.dotfiles/.zsh.d/config/.zsh_config

#======================================================================
# package
#======================================================================

source ~/.dotfiles/.zsh.d/package/zsh.d/zshrc

#======================================================================
# ls_colors
#======================================================================

source ~/.dotfiles/.zsh.d/color/.zsh_lscolor

#======================================================================
# zsh-style
#======================================================================

source ~/.dotfiles/.zsh.d/style/.zsh_style

#======================================================================
# history
#======================================================================

source ~/.dotfiles/.zsh.d/history/.zsh_history

#======================================================================
# alias
#======================================================================

source ~/.dotfiles/.zsh.d/alias/.zsh_alias

#======================================================================
# function
#======================================================================

source ~/.dotfiles/.zsh.d/functions/.zsh_functions

#======================================================================
# constants
#======================================================================

source ~/.dotfiles/.zsh.d/const/.zsh_const

#======================================================================
# prompt
#======================================================================

source ~/.dotfiles/.zsh.d/prompt/.zsh_prompt

