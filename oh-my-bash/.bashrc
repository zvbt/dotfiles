# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

export OSH='/c/Users/cyadine/.oh-my-bash'
OSH_THEME="rana"
alias mpv='mpv.com'
PATH=$PATH:/c/tools/
OMB_USE_SUDO=true
completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source "$OSH"/oh-my-bash.sh