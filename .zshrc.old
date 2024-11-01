# ▒███████▒▄▄▄      ██▀███  ▄▄▄    ▄▄▄█████▓██░ ██ █    ██  ██████▄▄▄█████▓██▀███  ▄▄▄
# ▒ ▒ ▒ ▄▀▒████▄   ▓██ ▒ ██▒████▄  ▓  ██▒ ▓▓██░ ██▒██  ▓██▒██    ▒▓  ██▒ ▓▓██ ▒ ██▒████▄
# ░ ▒ ▄▀▒░▒██  ▀█▄ ▓██ ░▄█ ▒██  ▀█▄▒ ▓██░ ▒▒██▀▀██▓██  ▒██░ ▓██▄  ▒ ▓██░ ▒▓██ ░▄█ ▒██  ▀█▄
#   ▄▀▒   ░██▄▄▄▄██▒██▀▀█▄ ░██▄▄▄▄█░ ▓██▓ ░░▓█ ░██▓▓█  ░██░ ▒   ██░ ▓██▓ ░▒██▀▀█▄ ░██▄▄▄▄██
# ▒███████▒▓█   ▓██░██▓ ▒██▒▓█   ▓██▒▒██▒ ░░▓█▒░██▒▒█████▓▒██████▒▒ ▒██▒ ░░██▓ ▒██▒▓█   ▓██▒
# ░▒▒ ▓░▒░▒▒▒   ▓▒█░ ▒▓ ░▒▓░▒▒   ▓▒█░▒ ░░   ▒ ░░▒░░▒▓▒ ▒ ▒▒ ▒▓▒ ▒ ░ ▒ ░░  ░ ▒▓ ░▒▓░▒▒   ▓▒█░
# ░░▒ ▒ ░ ▒ ▒   ▒▒ ░ ░▒ ░ ▒░ ▒   ▒▒ ░  ░    ▒ ░▒░ ░░▒░ ░ ░░ ░▒  ░ ░   ░     ░▒ ░ ▒░ ▒   ▒▒ ░
# ░ ░ ░ ░ ░ ░   ▒    ░░   ░  ░   ▒   ░      ░  ░░ ░░░░ ░ ░░  ░  ░   ░       ░░   ░  ░   ▒
#   ░ ░         ░  ░  ░          ░  ░       ░  ░  ░  ░          ░            ░          ░  ░
# ░
#
# @z4rathustr4 personal zshrc config. Feel free to share, modify, copy and redistribute,
# as this is a work I enjoy doing, sharing, teaching and learning.
#                                   CC BY-NC-SA

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="htb"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-line                 # page up
bindkey '^[[6~' end-of-line                       # page down
# bindkey '^[[H' beginning-of-line                  # home
# bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-*|*-256color) color_prompt=yes;;
esac

###################################################
#                fix kitty color                  #
###################################################



# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=yes
    fi
fi

configure_prompt() {
    prompt_symbol=㉿
    # Skull emoji for root terminal
    [ "$EUID" -eq 0 ] && prompt_symbol=💀
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
            # Right-side prompt with exit codes and background processes
            RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
            ;;
        oneline)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b%F{reset}%(#.#.$) '
            RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
            ;;
        backtrack)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
            RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
            ;;
    esac
    unset prompt_symbol
}

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=oneline
NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    configure_prompt

    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
# unset color_prompt force_color_prompt
######################
# None of this shiet #
######################
# toggle_oneline_prompt(){
#     if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
#         PROMPT_ALTERNATIVE=twoline
#     else
#         PROMPT_ALTERNATIVE=oneline
#     fi
#     configure_prompt
#     zle reset-prompt
# }
# zle -N toggle_oneline_prompt
# bindkey ^P toggle_oneline_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
*)
    ;;
esac

precmd() {
    # Print the previously configured title
    print -Pnr -- "$TERM_TITLE"

    # Print a new line before the prompt, but only if it is not the first line
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

ZSH_FZF_HISTORY_SEARCH_BIND="^r"


###########################################################
# ======================================================= #
#                   USER DEFINED ALIASES                  #
# ======================================================= #
###########################################################

# z4rathustr4's aliases
alias ll='lsd -lh --group-dirs=first --color=always'
alias la='lsd -a --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd -lh --group-dirs=first --color=always'
alias cat='bat'
alias crp="rsync -HAXhaxvPS --numeric-ids --stats "
alias vim="nvim "
alias starwarz="telnet towel.blinkenlights.nl"
alias playlist-dl='yt-dlp -o "%(playlist_index)s-%(title)s.%(ext)s"'
# alias pacdesc="pacman -Ss | paste -d '' - - | sk --multi --preview 'pacman -Si {1}' | cut -d ' ' -f 1 | xargs -ro pacman -Si"
alias wanip="dig @resolver4.opendns.com myip.opendns.com +short"
# alias cp="/usr/bin/advcp -g "
# alias mv="/usr/bin/advmv -g "
# alias icat="kitty +kitten icat "
###########################################################
# rust-powered aliases
alias e='exa -l'
alias eh='exa -la'


###########################################################
# ======================================================= #
#                   USER DEFINED FUNCTIONS                #
# ======================================================= #
###########################################################
#
# Functions
function mkt(){
	mkdir {bin,reversing,stego,web,crypto,misc}
}

function mkcpp(){
	mkdir {src,lib,include,tests,doc}
}

function rf(){
    rm -rfv $1 | pv
}

function conan-inst ()
{
    if [[ -e "./conanfile.txt" ]]; then
	conan install . --output-folder=build --build=missing
    fi
}


# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

function sw-vpn() {
    if ["$1" = "up"]; then
        nmcli c up sw_tun0
    elif ["$1" = "down"]; then
        nmcli c down sw_tun0
    else
        echo -n "Usage: sw-vpn [up|down]"
    fi
}

function redel ()
{
  sed ':a;N;$!ba;s/\n/ /g' $1
}

###########################################################
# ======================================================= #
#                   USER DEFINED $PATHs                   #
# ======================================================= #
###########################################################

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin/scripts:$PATH
# export PATH=/home/operat0r/.nimble/bin:$PATH
export PATH="~/bin:$PATH"
# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
# export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

###########################################################
# ======================================================= #
#                  antigen plugin manager                 #
# ======================================================= #
###########################################################

source $HOME/.antigen.zsh


# load the oh-my-zsh's library.
antigen use oh-my-zsh

# bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle DarrinTisdale/zsh-aliases-exa

# syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle joshskidmore/zsh-fzf-history-search
# load the theme (no theme)
# antigen theme ikirt/htb-ohmyzsh-theme
# antigen theme halfo/lambda-mod-zsh-theme
# tell antigen that you're done.
antigen apply

# Add starship shell. It's written in rust and that is nice.
# UPDATE: DO NOT EVER USE STARSHIP SHELL, LAGGY AF
# eval "$(starship init zsh)"

# -- endCustom --

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export ANDROID_NDK_HOME=/opt/android-ndk
export ANDROID_SDK_ROOT=/opt/android-sdk
export CHROME_EXECUTABLE=/usr/bin/chromium
export FVM_HOME="$HOME/fvm"
export PATH="/opt/flutter/bin:$PATH"


# Execute ssh-agent on shell initialization

eval "$(ssh-agent -s >/dev/null 2>&1)"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# export PATH=/home/operat0r/.nimble/bin:/usr/share/pyenv/plugins/pyenv-virtualenv/shims:/home/operat0r/.pyenv/shims:/home/operat0r/.pyenv/bin:~/bin:/home/operat0r/.local/bin/scripts:/home/operat0r/.local/bin:/home/operat0r/bin:/usr/local/bin:/home/operat0r/.cargo/bin:/usr/bin:/bin:/usr/local/sbin:/home/operat0r/.dotnet/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/operat0r/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/home/operat0r/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:/home/operat0r/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku:/home/operat0r/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip:/home/operat0r/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/lein:/home/operat0r/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:/home/operat0r/.antigen/bundles/zsh-users/zsh-syntax-highlighting:/home/operat0r/.antigen/bundles/zsh-users/zsh-autosuggestions:/home/operat0r/.antigen/bundles/joshskidmore/zsh-fzf-history-search:/home/operat0r/.antigen/bundles/tjquillan/pastel


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

PATH="/home/operat0r/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/operat0r/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/operat0r/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/operat0r/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/operat0r/perl5"; export PERL_MM_OPT;

if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# bun completions
[ -s "/home/operat0r/.local/share/reflex/bun/_bun" ] && source "/home/operat0r/.local/share/reflex/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/amro.omp.json)"
fi

# if [ -f ~/.config/oh-my-posh/oh-my-posh.zsh ]; then
#     source ~/.config/oh-my-posh/oh-my-posh.zsh
# else
#     print "[🤷]: ~/.zsh/zshalias not found."
# fi


_z_cd() {
    cd "$@" || return "$?"

    if [ "$_ZO_ECHO" = "1" ]; then
        echo "$PWD"
    fi
}

z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        _zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
    fi
}

zi() {
    _zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}


alias za='zoxide add'

alias zq='zoxide query'
alias zqi='zoxide query -i'

alias zr='zoxide remove'
zri() {
    _zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}


_zoxide_hook() {
    zoxide add "$(pwd -L)"
}

chpwd_functions=(${chpwd_functions[@]} "_zoxide_hook")


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/z4rathustr4/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# Added by ProtonUp-Qt on 19-07-2024 12:51:47
if [ -d "/home/z4rathustr4/stl/prefix" ]; then export PATH="$PATH:/home/z4rathustr4/stl/prefix"; fi
