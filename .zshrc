# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
#export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# for dinghy nfs
export DINGHY_PROXY_CERTS_DIR=/Users/joo/dev/git/certs
export DINGHY_HOST_MOUNT_DIR=/Users/joo/dev/git
export DINGHY_GUEST_MOUNT_DIR=/Users/joo/dev/git

# ------------------------------
# for Android SDK
# ------------------------------
export ANDROID_SDK_ROOT=/Users/joo/Library/Android/sdk
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`



# rbenv設定
export PATH="/usr/local/bin:${JAVA_HOME}/bin:/Users/joo/Library/Python/2.7/bin:/usr/local/opt/openssl/bin:/usr/local:./node_modules/.bin:$HOME/.nodebrew/current/bin:$ANDROID_SDK_ROOT/platform-tools:$HOME/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


# nodebrew
export NODEBREW_ROOT=/usr/local/var/nodebrew


# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# 日本語ファイル名を表示可能にする
setopt PRINT_EIGHT_BIT


# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work


# linuxのコマンド履歴をCtrl-Sで前方検索
stty stop undef


#alias list
source ~/.aliases

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
PROMPT="%B%{${fg[green]}%}%n@%m%u%{${reset_color}%}%b:%B%{${fg[blue]}%}%~%{${reset_color}%}%b
$ "
#PROMPT='%F{10}%n@%m%f:%F{12}%4(~,%-1~/.../%1~,%~)%f
#%0(?.%#.%F{9}%#%f) '
RPROMPT='%*'
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}" ;

### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    #echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac

## load user .zshrc configuration file
#[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joo/dev/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/joo/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joo/dev/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/joo/dev/google-cloud-sdk/completion.zsh.inc'; fi
