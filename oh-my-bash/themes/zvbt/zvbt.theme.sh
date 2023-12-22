#! bash oh-my-bash.module

OSH_THEME_GIT_PROMPT_DIRTY="✗"
OSH_THEME_GIT_PROMPT_CLEAN="✓"
CLOCK_THEME_PROMPT_PREFIX=''
CLOCK_THEME_PROMPT_SUFFIX=' '
THEME_SHOW_CLOCK=${THEME_SHOW_CLOCK:-"true"}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$_omb_prompt_bold_navy"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%I:%M:%S"}
OMB_PROMPT_VIRTUALENV_FORMAT='(%s) '
OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:=true}

function _omb_theme_half_way_prompt_scm {

  local hostname="${_omb_prompt_bold_gray}\u@\h"
  local CHAR=$(scm_char)
  if [[ $CHAR != "$SCM_NONE_CHAR" ]]; then
    printf '%s' " on ${_omb_prompt_navy}$(git_current_branch)$(parse_git_dirty)${_omb_prompt_normal} "
  fi
}

function _omb_theme_PROMPT_COMMAND {
  local ps_username="${_omb_prompt_purple}\u@\h${_omb_prompt_normal}"
  local ps_path="${_omb_prompt_green}\w${_omb_prompt_normal}"
  local ps_user_mark="${_omb_prompt_red}λ${_omb_prompt_normal}"

  PS1="$(clock_prompt)${hostname}$ps_username $ps_path$(_omb_theme_half_way_prompt_scm) $ps_user_mark "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
