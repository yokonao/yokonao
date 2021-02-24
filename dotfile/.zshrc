#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# 2行表示
PROMPT="
%~
"

# direnv
eval "$(direnv hook zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/bin:$PATH"

#nodebrew
export PATH=$PATH:/Users/yokotsukanao/.nodebrew/current/bin

# AWS
export AWS_ACCESS_KEY_ID=AKIA5FWB7BTIM7GZNVOY
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=ap-northeast-1

# dotnet
export PATH="$PATH:/Users/yokotsukanao/.dotnet/tools"

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# flutter
export PATH=$PATH:/Users/yokotsukanao/development/flutter/bin

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u      

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups


# vcs_infoを読み込み
autoload -Uz vcs_info
 
# vcs_info_msg_0_変数をどのように表示するかフォーマットの指定
## デフォルトのフォーマット
### %s: どのバージョン管理システムを使っているか（git, svnなど）
### %b: ブランチ名
zstyle ':vcs_info:*' formats '(%s)[%b]'
## 特別な状態（mergeでコンフリクトしたときなど）でのフォーマット
### %a: アクション名（merge, rebaseなど）
zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'
 
# プロンプトが表示される毎にバージョン管理システムの情報を取得
## precmd: プロンプトが表示される毎に実行される関数
## vcs_info: バージョン管理システムから情報を取得
precmd () { vcs_info }
 
# 右プロンプトに表示
## prompt_subst: プロンプトを表示する際に変数を展開するオプション
setopt prompt_subst
## vcs_info_msg_0_: バージョン管理システムの情報
## RPROMPT: 右プロンプトに情報を表示するときの環境変数
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# alias
## Shorthand
alias cl='clear'
alias config='code ~/.zshrc'
alias reload='source ~/.zshrc'
alias atc='atcoder'
alias record='xcrun simctl io booted recordVideo'
alias study='code ~/src/github.com/yokonao/chilvary-markdown/'
## Git
alias g='git'
## Docker
alias doc='docker'
alias docc='docker-compose'
## Terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfd='terraform destroy'
## Ruby
alias bx='bundle exec'
## Python
alias py='python'
## Flutter
alias freezed='flutter pub run build_runner build --delete-conflicting-outputs'
## Custom cd command
alias hm='cd ~'
alias vic='cd ~/src/github.com/tech-consiglie/victorian'
alias chilvary='cd ~/work/next_js/chilvary-beta'
alias abc='cd ~/src/github.com/yokonao/atcoder/ABC/'
alias agc='cd ~/src/github.com/yokonao/atcoder/AGC/'
alias haccp='cd ~/src/github.com/WA-HC/sato_haccp_cloud_flutter'
alias yokonao='cd ~/src/github.com/yokonao/'
alias fortitude='cd ~/go/src/github.com/yokonao/fortitude'
alias gumption='cd ~/src/github.com/yokonao/gumption'
alias hooligan='cd ~/src/github.com/yokonao/hooligan'
alias ibis='cd ~/endocrine/src/Ibis'
alias drsub='cd ~/src/github.com/Attracture/DragonAppArComponent'
alias drmain='cd ~/src/github.com/Attracture/DragonApp'
alias alsim='cd ~/src/github.com/Attracture/ALSimApp'

# functions
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}

mkcd() {
  mkdir $1
  cd $1
}

atmk() {
  mkcd $1
  touch a.cpp
  touch b.cpp
  touch c.cpp
  touch d.cpp
}
