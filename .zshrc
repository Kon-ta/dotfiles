PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/

autoload -U compinit
compinit

zstyle ':completion:*' list-colors "${LS_COLORS}" # 補完候補のカラー表示
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
setopt auto_cd
setopt auto_pushd
setopt correct

## ヒストリを共有
setopt share_history

## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs


#プロンプト設定
autoload colors
colors
PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "
PROMPT2='[%n]> ' 



#ファイル、ディレクトリの色付け
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'



#alias
alias la="ls -al"
alias gls="gls --color"


#cd後にlsを実行
function cd() {
  builtin cd $@ && ls;
}

#ファイルの名前検索のエイリアス
function findname () {
find ${1} -name ${2};
}

#ファイルの中についての名前検索

function findgrep () {
find "${1}" -type f -print | xargs grep "${2}";
}

