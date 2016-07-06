# zplug.zsh
#
# Loaded by zplug when path assigned to ZPLUG_LOADFILE
#
# Use repo format for oh-my-zsh plugins so no random crap is sourced
#
# Make sure fpaths are defined before or within zplug -- it calls compinit
# again in between loading plugins and nice plugins.
#

# --------------------------------------------------------------------------
# Mine
# --------------------------------------------------------------------------

zplug "${ZDOTDIR}", \
  from:local, \
  use:"{keybindings,prompt,title}.zsh"

zplug "davidosomething/git-ink",  as:command
zplug "davidosomething/git-my",   as:command
zplug "davidosomething/git-open", as:command

# my fork of cdbk, zsh hash based directory bookmarking
zplug "davidosomething/cdbk"

# --------------------------------------------------------------------------
# Vendor
# --------------------------------------------------------------------------

zplug "plugins/colored-man-pages", from:oh-my-zsh

# In-line best history match suggestion
zplug "tarruda/zsh-autosuggestions"

# Various program completions
# This adds to fpath (so before compinit)
zplug "zsh-users/zsh-completions"

# --------------------------------------------------------------------------
# LAST, these call "compdef" so must be run after compinit, enforced by nice
# --------------------------------------------------------------------------

# fork of rupa/z with better completion (so needs nice)
zplug "knu/z",  \
  use:"z.sh",   \
  nice:10

# --------------------------------------------------------------------------
# Completions that require compdef (so nice 10)
# --------------------------------------------------------------------------

# gulp completion (parses file so not 100% accurate)
zplug "akoenig/gulp.plugin.zsh", nice:10

zplug "plugins/golang", \
  from:oh-my-zsh,       \
  nice:10

zplug "lukechilds/zsh-better-npm-completion", \
  nice:10

# 2016-04-27 nvm assumes ~/.nvm exists, so probably not working
zplug "robbyrussell/oh-my-zsh", \
  use:"plugins/nvm/_nvm",       \
  nice:10

# homebrew
# note regular brew completion is broken:
# @see <https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Tips-N'-Tricks.md#zsh>
# @see <https://github.com/Homebrew/homebrew/issues/49066>
#
# fix by symlinking
#     ln -s $(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh \
  #     $(brew --prefix)/share/zsh/site-functions/_brew
#
# These addons need to be nice, otherwise won't override _brew

zplug "vasyharan/zsh-brew-services",  \
  if:"[[ $OSTYPE == *darwin* ]]",     \
  nice:10

zplug "plugins/brew-cask",        \
  from:oh-my-zsh,                 \
  if:"[[ $OSTYPE == *darwin* ]]", \
  nice:10                         \

# completions I have locally
zplug "${ZDOTDIR}",     \
  from:local,           \
  use:"completions/_*", \
  nice:11

# highlight as you type
zplug "zsh-users/zsh-syntax-highlighting", nice:19

zplug "zplug/zplug"
