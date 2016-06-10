PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/



#######alias######

##################
export XDG_CONFIG_HOME=~/.config #neovim環境設定


autoload -U compinit
compinit

setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
setopt auto_cd
setopt auto_pushd
setopt correct

#プロンプト設定
autoload colors
colors
PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "
PROMPT2='[%n]> ' 



#ファイル、ディレクトリの色付け


export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -G"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'



#cd後にlsを実行
function cd() {
  builtin cd $@ && ls;
}


