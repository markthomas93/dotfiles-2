####
# .dotfiles/zsh/zshrc.zsh
# zsh options
# only run on interactive/TTY

##
# command history
# these exports only needed when there's a TTY
export HISTFILE="$ZDOTDIR/.zhistory"
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY                 # append instead of overwrite file
setopt SHARE_HISTORY                  # append after each new command instead
                                      # of after shell closes, share between
                                      # shells
setopt HIST_VERIFY                    # verify when using history cmds/params

##
# shell options
setopt AUTO_LIST                      # list completions
setopt AUTO_PUSHD                     # pushd instead of cd
setopt CDABLE_VARS
setopt CORRECT
setopt EXTENDED_GLOB                  # like ** for recursive dirs
setopt NO_BEEP
setopt NO_HUP                         # don't kill bg processes
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT                   # don't show stack after cd
setopt PUSHD_TO_HOME                  # go home if no d specified
setopt COMPLETEALIASES                # autocomplete switches for aliases

##
# tab completion paths
fpath=(
  $ZSH_DOTFILES/zsh-completions/src
  $(brew --prefix)/share/zsh/site-functions
  #  $(brew --prefix)/share/zsh-completions
  $fpath
)
typeset -U fpath

# load completion - the -U means look in fpath, -z means on first run
autoload -Uz compinit && compinit -i
#autoload -Uz bashcompinit && bashcompinit

##
# zstyles
# case-insensitive tab completion for filenames (useful on Mac OS X)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' expand 'yes'
# don't autocomplete usernames/homedirs
zstyle ':completion::complete:cd::' tag-order '! users' -

##
# zsh-syntax-highlighting plugin
source $ZSH_DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $BASH_DOTFILES/aliases.sh
source $BASH_DOTFILES/functions.sh
source $ZSH_DOTFILES/aliases.zsh
source $ZSH_DOTFILES/functions.zsh
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

source $ZSH_DOTFILES/keybindings.zsh
source $ZSH_DOTFILES/prompt.zsh

##
# os specific
case "$OSTYPE" in
  darwin*)  source $ZSH_DOTFILES/zshrc-osx.zsh
            ;;
  linux*)   source $ZSH_DOTFILES/zshrc-linux.zsh
            ;;
esac

##
# local
[ -f "$ZDOTDIR/.zshrc.local" ] && source $ZDOTDIR/.zshrc.local
