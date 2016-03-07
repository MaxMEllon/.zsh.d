source ~/.zplug/zplug

local sources=$HOME/.zplug/repos

zplug 'hchbaw/auto-fu.zsh'
zplug 'mollifier/cd-gitroot'
zplug 'mrowa44/emojify', as:command
zplug 'supercrabtree/k'
zplug 'zsh-users/zsh-completions'
zplug 'rupa/z', of:z.sh
zplug 'zsh-users/zsh-syntax-highlighting', nice:10

# k
if [ -d $sources/supercrabtree/k ]; then
  alias ll='k --no-vcs'
  alias ll='k -a --no-vcs'
fi

# auto-fu.zsh
if [ -d $sources/hchbaw/auto-fu.zsh ]; then
  function zle-line-init() { auto-fu-init }
  zle -N zle-line-init
  zstyle ':auto-fu:var' postdisplay $''
fi

export PATH=~/.zplug/bin:${PATH}

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

autoload -U compinit
compinit

source ~/.bashrc
export LANG=ja_JP.UTF-8
export KCODE=u

# config {{{
setopt   AUTO_MENU              # タブキーの連打で自動的にメニュー補完
unsetopt AUTO_CD                # /foo/barでいきなりcd（しない）
setopt   AUTO_NAME_DIRS         # "~$var" でディレクトリにアクセス
setopt   AUTO_PARAM_KEYS        # 変数名を補完する
setopt   PROMPT_SUBST           # プロンプト文字列で各種展開を行なう
setopt   prompt_percent         # PROMPT内で「%」文字から始まる置換機能を有効にする。
setopt   transient_rprompt      # コピペしやすいようにコマンド実行後は右プロンプトを消す。
setopt   AUTO_RESUME            # サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt   MARK_DIRS              # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
unsetopt RM_STAR_WAIT           # rm *で確認する？
setopt   SUN_KEYBOARD_HACK      # 行の末尾がバッククォートでも無視する
setopt   EXTENDED_GLOB          # ~hoge以外にマッチする機能を使う
setopt   LIST_TYPES             # 補完対象のファイルの末尾に識別マークをつける
setopt   NO_BEEP                # BEEPを鳴らさない
setopt   ALWAYS_LAST_PROMPT     # 補完候補など表示する時はその場に表示し、終了時に画面から消す
setopt   CDABLE_VARS            # cd kotaで/home/kotaに移動する
setopt   SH_WORD_SPLIT          # クォートされていない変数拡張が行われたあとで、フィールド分割
setopt   ALL_EXPORT             # 定義された全ての変数は自動的にexportする
setopt   AUTO_PARAM_SLASH       # ディレクトリ名を補完すると、末尾がスラッシュになる。
setopt   AUTO_PUSHD             # 普通のcdでもスタックに入れる
setopt   CORRECT                # コマンドのスペルの訂正を使用する
unsetopt GLOB_DOTS              # "*" にドットファイルをマッチしない
setopt   LIST_PACKED            # 補完候補を詰めて表示
setopt   PUSHD_IGNORE_DUPS      # ディレクトリスタックに、同じディレクトリを入れない
setopt   NO_LIST_BEEP           # 補完の時にベルを鳴らさない
unsetopt IGNORE_EOF             # ^Dでログアウトしない
setopt   NOTIFY                 # ジョブの状態をただちに知らせる
setopt   MULTIOS                # 複数のリダイレクトやパイプに対応
setopt   NUMERIC_GLOB_SORT      # ファイル名を数値的にソート
unsetopt NOCLOBBER              # リダイレクトで上書き禁止
setopt   MAGIC_EQUAL_SUBST      # =以降でも補完できるようにする
setopt   PRINT_EIGHT_BIT        # 補完候補リストの日本語を正しく表示
setopt   TRANSIENT_RPROMPT      # 右プロンプトに入力がきたら消す
unsetopt PRINT_EXIT_VALUE       # 戻り値が0以外の場合終了コードを表示
setopt   BRACE_CCL              # echo {a-z}などを使えるようにする
setopt   HISTVERIFY             # !!などを実行する前に確認する
setopt   HIST_IGNORE_SPACE      # 余分な空白は詰めて記録
setopt   APPEND_HISTORY         # ヒストリファイルを上書きするのではなく、追加するようにする
unsetopt NO_CHECK_JOBS          # ジョブがあっても黙って終了する
setopt   EXTENDED_HISTORY       # ヒストリに時刻情報もつける
setopt   HIST_EXPIRE_DUPS_FIRST # 履歴がいっぱいの時は最も古いものを先ず削除
setopt   HIST_FIND_NO_DUPS      # 履歴検索中、重複を飛ばす
setopt   HIST_NO_FUNCTIONS      # ヒストリリストから関数定義を除く
setopt   HIST_IGNORE_DUPS       # 前のコマンドと同じならヒストリに入れない
setopt   HIST_IGNORE_ALL_DUPS   # 重複するヒストリを持たない
unsetopt hist_verify            # ヒストリを呼び出してから実行する間に一旦編集可能
setopt   INC_APPEND_HISTORY     # 履歴をインクリメンタルに追加
setopt   HIST_NO_STORE          # history コマンドをヒストリに入れない
setopt   HIST_REDUCE_BLANKS     # 履歴から冗長な空白を除く
setopt   NO_PROMPTCR            # 改行コードで終らない出力もちゃんと出力する
setopt   SHORT_LOOPS            # loop の短縮形を許す
setopt   SHARE_HISTORY          # 履歴を共有
unsetopt FUNCTION_ARGZERO       # $0 にスクリプト名/シェル関数名を格納
setopt   NO_FLOW_CONTROL        # Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt   INTERACTIVE_COMMENTS   # コマンドラインでも # 以降をコメントと見なす
unsetopt SINGLE_LINE_ZLE        # デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
setopt   COMPLETE_IN_WORD       # 語の途中でもカーソル位置で補完
setopt   NO_TIFY                # バックグラウンドジョブが終了したらすぐに知らせる。
bindkey  -e                     # ライン操作はEmacsスタイルで行う
# }}}
# functions {{{
color256() {
  local red=$1; shift
  local green=$2; shift
  local blue=$3; shift
  echo -n $[$red * 36 + $green * 6 + $blue + 16]
}

fg256() {
  echo -n $'\e[38;5;'$(color256 "$@")"m"
}

bg256() {
  echo -n $'\e[48;5;'$(color256 "$@")"m"
}

_set_tmux_window() {
  if [ "$TMUX" ]; then
    # tmux display
    #   -p 標準出力へ
    #   #I ウィンドウ番号
    #   #P ペイン番号
    export TMUX_WINDOW=$(tmux display -p '#I-#P')
  fi
}

# prompt-git-current-branch
function current_branch {
  if [[ "$PWD" = ${DOTFILES}'/\.git(/.*)?$' ]]; then
    echo "%{%B${fg[black]}%}no git%{${reset_color}%}%b"
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    echo "%{%B${fg[black]}%} branch %{${reset_color}%}%b"
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=${bg[blue]}${fg[green]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${bg[red]}${fg[blue]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${bg[red]}${fg_bold[white]}
  else
    color=${bg[red]}${fg_bold[white]}
  fi
  # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
  # これをしないと右プロンプトの位置がずれる
  echo "%{$color%}%{%B%} $name %{%b%}%{$reset_color%}"
}

# cd後自動でls
function chpwd() { ls_abbrev }

ls_abbrev() {
  local cmd_ls='ls'
  local -a opt_ls
  opt_ls=('-CF' '--color=always')
  case "${OSTYPE}" in
  freebsd*|darwin*)
    if type gls > /dev/null 2>&1; then
      cmd_ls='gls'
    else
      opt_ls=('-CFG')
    fi
    ;;
  esac

  local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt  6 ]; then
      echo "$ls_result" | head -n 3
      echo '...'
      echo "$ls_result" | tail -n 3
      echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
      echo "$ls_result"
    fi
}

# 時刻更新
function TRAPALRM () { zle reset-prompt }
TMOUT=60

function git_status {
  which git > /dev/null
  if [ $? -ne 0 ]; then
    echo "Plese install peco and git"
    return 1
  fi
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    BUFFER='git status -s'
    zle accept-line
  else
    return 1
  fi
}
zle -N git_status
bindkey '^j^s' git_status

# See: https://github.com/iguto/dotfiles/blob/master/zsh.d/my_widgets.zsh#L69-L78
function peco-git-recent-branches
{
  which git peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Plese install peco and git"
    return 1
  fi
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    local selected_branch=$( git for-each-ref --format='%(refname)' --sort=-committerdate  refs/heads | ruby -pne '$_.gsub!(/refs\/(heads|remotes)\//, "")' | peco )
    if [ -n "$selected_branch" ]; then
      BUFFER="git checkout $selected_branch"
      zle accept-line
    fi
  else
    return 1
  fi
}

zle -N peco-git-recent-branches
bindkey '^j^b' peco-git-recent-branches

function peco-tmux-session
{
  which tmux peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and tmux"
    return 1
  fi
  local res
  res=$(\tmux list-sessions | peco | awk -F':' '{print $1}')
  if [ -n "$res" ]; then
    if [ -n "$TMUX" ]; then
      BUFFER="tmux switch-client -t $res"
    else
      BUFFER="tmux attach -t $res"
    fi
    zle accept-line
  fi
}
zle -N peco-tmux-session
bindkey '^s' peco-tmux-session

# See: http://qiita.com/xtetsuji/items/05f6f4c1b17854cdd75b
function peco-lscd {
  which peco > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco"
    return 1
  fi
  local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
}
zle -N peco-lscd
alias lscd='peco-lscd'

# See:https://github.com/ryoppy/cool-peco/blob/master/functions/cool-peco-filename-search
function peco-file-name-search
{
  which fzf > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install fzf"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-file-name-search
bindkey '^f' peco-file-name-search

function peco-select-history
{
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    fzf --reverse --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# See: http://qiita.com/fmy/items/b92254d14049996f6ec3
function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
# }}}
# prompt {{{
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
    '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}]'
zstyle ':vcs_info:*' actionformats \
    '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}|%{%F{white}%K{red}%}%a%{%f%k%}]'

prompt_bar_left_user='$c_user'
prompt_bar_left_host='$c_host%m:'
prompt_bar_left_branch='`current_branch`'
prompt_bar_left_status="%{%B%(?.%K{blue}%F{white}.%K{red}%F{white})%} %? %{%f%b%}"
prompt_bar_left_date='<%{%B%}%D{%H:%M}%{%b%}>'
# prompt_bar_left_path="%{%B%F{red}%}%d%{%f%k%b%}"
prompt_bar_left_path="%{%B%F{yellow}%}%~ %{%f%k%b%}"
prompt_bar_left_deco='%{%B%F{magenta}%}'
prompt_bar_left="${prompt_bar_left_status}${prompt_bar_left_branch} ${prompt_bar_left_host}${prompt_bar_left_path}${prompt_bar_left_deco}"
prompt_left='%{%B%F{magenta}%} $role->%{%f%b%}'

count_prompt_characters()
{
    print -n -P -- "$1" | sed -e $'s/\e\[[0-9;]*m//g' | wc -m | sed -e 's/ //g'
}

update_prompt()
{
    local bar_left_length=$(count_prompt_characters "$prompt_bar_left")
    local bar_rest_length=$[COLUMNS - bar_left_length]
    local bar_left="$prompt_bar_left"
    local bar_right_without_path="${prompt_bar_right:s/%d//}"
    local bar_right_without_path_length=$(count_prompt_characters "$bar_right_without_path")
    local max_path_length=$[bar_rest_length - bar_right_without_path_length]
    bar_right=${prompt_bar_right:s/%d/%(C,%${max_path_length}<...<%d%<<,)/}
    local separator="${(l:${bar_rest_length}::_:)}%{%k%f%b%}"
    bar_right="%${bar_rest_length}<<${separator}${bar_right}%<<"
    PROMPT="${bar_left}${bar_right}"$'\n'"${prompt_bar_left_user}${prompt_left}"
    RPROMPT="%{%K{blue}%}%{%F{white}%} %D{%Y/%m/%d %H:%M} %{%k%f%b%}"
    case "$TERM_PROGRAM" in
        Apple_Terminal)
            RPROMPT="${RPROMPT}-"
            ;;
    esac
}
precmd_functions=($precmd_functions update_prompt)
# }}}
# ls {{{
export LS_COLORS='di=01;34;40:ln=01;36:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export CLICOLOR=true
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
autoload -U colors; colors
# }}}
# alias {{{
case $(uname) in
  *BSD|Darwin)
    if [ -x "$(which gnuls)" ]; then
      alias ls="gnuls"
      alias la="ls -lhAF --color=auto"
    else
      alias la="ls -lhAFG"
    fi
    alias ps="ps -fU$(whoami)"
    ;;
  SunOS)
    if [ -x "`which gls`" ]; then
      alias ls="gls"
      alias la="ls -lhAF --color=auto"
    else
      alias la="ls -lhAF"
    fi
    alias ps="ps -fl -u$(/usr/xpg4/bin/id -un)"
    ;;
  *)
    alias la="ls -lhAF --color=auto"
    alias ps="ps -fU$(whoami) --forest"
    ;;
esac
# grep
alias grep='grep --color=auto'
alias lg='ls -a | grep'

# git
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'

# cd ..
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# tmux
alias aliastx='alias | grep tmux'
alias tmls='\tmux list-sessions'
alias tmlc='\tmux list-clients'
alias killtmux='\tmux kill-server'
alias tmkl='\tmux kill-session'
alias tmaw='\tmux main-horizontal'
alias tmuxa='\tmux -2 a -t'
# tmux起動中にtmuxコマンドが使用できるように
if [ "$SHLVL" -eq 1 ]; then
  alias tmx='tmux -2 new-session'
fi

# platuml
alias uml="java -jar ${HOME}/local/bin/plantuml.jar -tpng"

# z
alias j='z'

# cd-gitroot
alias cdu='cd-gitroot'

# gisty
# alias gisty='gisty post'

# vim
: alias mvim='mvim -g'

# rails
alias be='bundle exec'
alias railss='rails s -b 0.0.0.0'

alias :q='exit'

# ag
alias ag="ag --pager=\"less -R\""

alias gyazo="gyazo-cli"
# }}}
# history {{{
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt extended_history
LISTMAX=1000
WORDCHARS="$WORDCHARS|:"
bindkey 'bindkey' history-beginning-search-backward # 先頭マッチのヒストリサーチ
bindkey 'ヒストリーサイズ' history-beginning-search-forward  # 同上
# }}}
# constants {{{
gn=${fg[green]}
yw=${fg[yellow]}
be=${fg[blue]}
cn=${fg[cyan]}
ma=${fg[magenta]}
rd=${fg[red]}
gy=${fg[gray]}
rc=$reset_color

colors=(
  ## 気に入らない色はコメントアウト
  # $'%{\e[0;30m%}' # black
  $'%{\e[0;31m%}' # red
  $'%{\e[0;32m%}' # green
  $'%{\e[0;33m%}' # brown
  $'%{\e[0;34m%}' # blue
  $'%{\e[0;35m%}' # purple
  $'%{\e[0;36m%}' # cyan
  # $'%{\e[0;37m%}' # gray

  ## light colors
  # $'%{\e[1;30m%}' # black
  $'%{\e[1;31m%}' # red
  $'%{\e[1;32m%}' # green
  $'%{\e[1;33m%}' # brown
  $'%{\e[1;34m%}' # blue
  $'%{\e[1;35m%}' # purple
  $'%{\e[1;36m%}' # cyan
  # $'%{\e[1;37m%}' # gray
)
c_user=$colors[$((`echo "$USER" | sum | cut -f1 -d' '`%${#colors}))+1]$USER
c_host=$colors[$((`echo "$HOST" | sum | cut -f1 -d' '`%${#colors}))+1]
c_ip=$colors[$((`echo "$IP" | sum | cut -f1 -d' '`%${#colors}))+1]($IP)
role='%(!.#.$)'
WORDCHARS='*?_-.[~=&;!#$%^({<>})]'
# }}}

