#!/bin/sh

# Welcome message with robot logo - works with sh, bash, zsh, and other shells

# Color definitions (256-color palette)
# Generate random color, excluding: 0, 8, 16-20, 52, 232-250
while :; do
  RANDOM_COLOR_CODE=$((RANDOM % 256))
  [ $RANDOM_COLOR_CODE -eq 0 ] && continue
  [ $RANDOM_COLOR_CODE -eq 8 ] && continue
  [ $RANDOM_COLOR_CODE -ge 16 ] && [ $RANDOM_COLOR_CODE -le 20 ] && continue
  [ $RANDOM_COLOR_CODE -eq 52 ] && continue
  [ $RANDOM_COLOR_CODE -ge 232 ] && [ $RANDOM_COLOR_CODE -le 250 ] && continue
  break
done

COLOR_MONSTER="\033[38;5;${RANDOM_COLOR_CODE}m"
COLOR_TEXT="\033[38;5;15m\033[1m"                 # White and bold
COLOR_TIME="\033[38;5;240m"                       # Dark gray
COLOR_BORDER=$COLOR_MONSTER
RESET="\033[0m"


echo -e " ${COLOR_BORDER}┌────────────────────────────────────────────────────────────────────────────┐${RESET}"
echo -e " ${COLOR_BORDER}│${RESET}   ${COLOR_MONSTER}🬢   🬖${RESET}    ${COLOR_TEXT}Welcome back, Your Highness 👑${RESET}                                  ${COLOR_BORDER}│${RESET}"
echo -e " ${COLOR_BORDER}│${RESET}  ${COLOR_MONSTER}🬞▛███▜🬏${RESET}   ${COLOR_TIME}$(date '+%Y-%m-%d %H:%M %p')${RESET}                                             ${COLOR_BORDER}│${RESET}"
echo -e " ${COLOR_BORDER}│${RESET} ${COLOR_MONSTER}🬔🬨█████🬕🬧${RESET}                                                                  ${COLOR_BORDER}│${RESET}"
echo -e " ${COLOR_BORDER}│${RESET}   ${COLOR_MONSTER}🬌🬋 🬋🬍${RESET}                                                                    ${COLOR_BORDER}│${RESET}"
echo -e " ${COLOR_BORDER}└────────────────────────────────────────────────────────────────────────────┘${RESET}"
