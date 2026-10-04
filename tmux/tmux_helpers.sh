#!/bin/bash
# =============================================================================
# tmux helper functions — extracted for status bar use and code reuse
# =============================================================================

# Extract username from a given TTY, handling SSH sessions
# Called via status bar: #(_username #{pane_tty})
_username() {
  local tty="${1:-}"
  local ssh_only="${2:-no}"

  # SSH over cygwin
  if [ x"$OSTYPE" = x"cygwin" ]; then
    local pid
    pid=$(ps -a | awk -v tty="${tty##/dev/}" '$5 == tty && /ssh/ && !/vagrant ssh/ && !/autossh/ && !/-W/ { print $1 }')
    if [ -n "$pid" ]; then
      local ssh_params
      ssh_params=$(tr '\0' ' ' < "/proc/$pid/cmdline" | sed 's/^ssh //')
      ssh -G $ssh_params 2>/dev/null | awk 'NR > 2 { exit } ; /^user / { print $2 }'
      return
    fi
  fi

  # SSH over Linux
  local ssh_params
  ssh_params=$(ps -t "$tty" -o command= 2>/dev/null | awk '/ssh/ && !/vagrant ssh/ && !/autossh/ && !/-W/ { $1=""; print $0; exit }')

  if [ -n "$ssh_params" ]; then
    ssh -G $ssh_params 2>/dev/null | awk 'NR > 2 { exit } ; /^user / { print $2 }'
    return
  fi

  # Local user
  if [ x"$ssh_only" = x"no" ]; then
    if [ x"$OSTYPE" = x"cygwin" ]; then
      whoami
    else
      ps -t "$tty" -o ruser=WIDE-RUSER-COLUMN -o pid= -o ppid= -o command= 2>/dev/null | awk '
        !/ssh/ { user[$2] = $1; ppid[$3] = 1 }
        END {
          for (i in user)
            if (!(i in ppid)) {
              print user[i]
              exit
            }
        }'
    fi
  fi
}

# Extract hostname from a given TTY, handling SSH sessions
# Called via status bar: #(_hostname #{pane_tty})
_hostname() {
  local tty="${1:-}"
  local ssh_only="${2:-no}"

  # SSH over cygwin
  if [ x"$OSTYPE" = x"cygwin" ]; then
    local pid
    pid=$(ps -a | awk -v tty="${tty##/dev/}" '$5 == tty && /ssh/ && !/vagrant ssh/ && !/autossh/ && !/-W/ { print $1 }')
    if [ -n "$pid" ]; then
      local ssh_params
      ssh_params=$(tr '\0' ' ' < "/proc/$pid/cmdline" | sed 's/^ssh //')
      ssh -G $ssh_params 2>/dev/null | awk 'NR > 2 { exit } ; /^hostname / { print $2 }'
      return
    fi
  fi

  # SSH over Linux
  local ssh_params
  ssh_params=$(ps -t "$tty" -o command= 2>/dev/null | awk '/ssh/ && !/vagrant ssh/ && !/autossh/ && !/-W/ { $1=""; print $0; exit }')

  if [ -n "$ssh_params" ]; then
    local hostname
    hostname=$(ssh -G $ssh_params 2>/dev/null | awk 'NR > 2 { exit } ; /^hostname / { print $2 }')
    # Shorten FQDN to short hostname (leave IPs as-is)
    [ -n "$hostname" ] && hostname=$(echo "$hostname" | awk '{ if ($1~/^[0-9.:]+$/) print $1; else { split($1, a, "."); print a[1] } }')
    echo "$hostname"
    return
  fi

  # Local hostname
  if [ x"$ssh_only" = x"no" ]; then
    command hostname -s 2>/dev/null
  fi
}

# Toggle mouse mode (used by status bar)
_toggle_mouse() {
  if tmux show -g -w 2>/dev/null | grep -q mode-mouse; then
    local old
    old=$(tmux show -g -w | grep mode-mouse | cut -d' ' -f2)
    local new=""
    if [ "$old" = "on" ]; then
      new="off"
    else
      new="on"
    fi
    tmux set -g mode-mouse $new \;\
         set -g mouse-resize-pane $new \;\
         set -g mouse-select-pane $new \;\
         set -g mouse-select-window $new \;\
         display "mouse: $new"
  else
    local old
    old=$(tmux show -g | grep mouse | head -n 1 | cut -d' ' -f2)
    local new=""
    if [ "$old" = "on" ]; then
      new="off"
    else
      new="on"
    fi
    tmux set -g mouse $new \;\
         display "mouse: $new"
  fi
}

"$@"
