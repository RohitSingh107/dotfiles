﻿## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set LANG en_US.utf8
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x LC_ALL "en_US.UTF-8"
set -x SOLANA_METRICS_CONFIG "host=https://metrics.solana.com:8086,db=devnet,u=scratch_writer,p=topsecret"
## Export variable need for qt-theme
# if type "qtile" >> /dev/null 2>&1
#    set -x QT_QPA_PLATFORMTHEME "qt5ct"
# end

set -x MOZ_ENABLE_WAYLAND 1
# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add Yarn bin to PATH
if test -d ~/.yarn/bin
    if not contains -- ~/.yarn/bin $PATH
        set -p PATH ~/.yarn/bin
    end
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

# Add Dart to PATH
if test -d ~/.pub-cache/bin
    if not contains -- ~/.pub-cache/bin $PATH
        set -p PATH ~/.pub-cache/bin
    end
end


## Starship prompt
if status --is-interactive
   # source ("/usr/bin/starship" init fish --print-full-init | psub)
   source ("starship" init fish --print-full-init | psub)
end

## Advanced command-not-found hook
# source /usr/share/doc/find-the-command/ftc.fish

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
alias ip="ip -color"

# Replace some more things with better alternatives
# alias cat='bat --style header --style rules --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
# alias apt='man pacman'
# alias apt-get='man pacman'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'               # Compare .pacnew & .pacsave files 
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Personal Alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vi="nvim";
alias newcode='git status && git add . && git commit -m "new code" && git push origin'
alias pushcfg='config status && config add -u && config commit -m "Updated fish history" && config push'
alias icat='kitty +kitten icat'

## nvim inputf.in -c "vsplit tmp.cpp" -c "wincmd l" -c "split outputf.in"
## nvim "inputf.in" -c "split outputf.in" -c "topleft vs tmp.cpp"

## Run neofetch if session is interactive
# if status --is-interactive && type -q neofetch
   # neofetch
# end

function tse 
	 nvim "~/mydata/code/C_and_C++/competitive_programming/outputf.in" -c "split ~/mydata/code/C_and_C++/competitive_programming/inputf.in" -c "topleft vs $argv"
end

function gcr
    g++ -Wall -Wextra $argv -o tmp && ./tmp
end

function ranger
    if test -z "$RANGER_LEVEL"
        /usr/bin/ranger $argv
    else
        exit
    end
end

function notify
    set -l job (jobs -l -g)
    or begin; echo "There are no jobs" >&2; return 1; end

    function _notify_job_$job --on-job-exit $job --inherit-variable job
        echo -n \a # beep
        functions -e _notify_job_$job
    end
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/rohits/.ghcup/bin $PATH # ghcup-env
export PATH="$PATH:/home/rohits/.foundry/bin"
# export PATH="$(yarn global bin):$PATH"
export PATH="/home/rohits/.deta/bin:$PATH"
export PATH="/home/rohits/.cargo/bin:$PATH"
export PATH="/home/rohits/.avm/bin:$PATH"
export PATH="/home/rohits/.local/share/solana/install/active_release/bin:$PATH"

# set -x XDG_CURRENT_DESKTOP sway

export PATH="$PATH:/home/rohits/.protostar/dist/protostar"


# pnpm
set -gx PNPM_HOME "/home/rohits/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
