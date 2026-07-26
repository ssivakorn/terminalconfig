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

COLOR_TEXT="$(printf '\033[38;5;15m\033[1m')"     # White and bold
COLOR_TIME="$(printf '\033[38;5;240m')"           # Dark gray
COLOR_BORDER="$(printf '\033[38;5;%dm' $RANDOM_COLOR_CODE)"
RESET="$(printf '\033[0m')"

# ASCII Art Definitions - change these to swap arts

ART_1_LINE1=""
ART_1_LINE2=""
ART_1_LINE3=""
ART_1_LINE4=""


# Art 1: Current monster
# ART1_LINE1="  🬢   🬖"
# ART1_LINE2=" 🬞▛███▜🬏"
# ART1_LINE3="🬔🬨█████🬕🬧"
# ART1_LINE4="  🬌🬋 🬋🬍"

# # Art 2: New monster variant
# ART2_LINE1="  🬢   🬖"
# ART2_LINE2="🬣🬞▛███▜🬏🬘"
# ART2_LINE3=" 🬨█████🬕"
# ART2_LINE4="  🬘   🬣"

ART_COUNT=1

# Pick an art at random
SELECTED_ART=$((RANDOM % ART_COUNT + 1))
eval "ART_LINE1=\$ART${SELECTED_ART}_LINE1"
eval "ART_LINE2=\$ART${SELECTED_ART}_LINE2"
eval "ART_LINE3=\$ART${SELECTED_ART}_LINE3"
eval "ART_LINE4=\$ART${SELECTED_ART}_LINE4"

COLOR_MONSTER="$(printf '\033[38;5;%dm' $RANDOM_COLOR_CODE)"

# Layout
INNER_WIDTH=76   # columns between the │ borders
GAP=3            # spaces between the art and the text

# Widest of the lines on stdin: strips ANSI codes, counts columns (emoji = 2).
# Takes a whole batch at once — perl startup costs more than the measuring does.
maxwidth() {
  perl -CS -ne '
    s/\e\[[0-9;]*m//g;
    chomp;
    $w = 0;
    for (split //) {
      my $o = ord;
      $w += ($o >= 0x1F300 && $o <= 0x1FAFF) || ($o >= 0x2600 && $o <= 0x27BF) ? 2 : 1;
    }
    $m = $w if $w > $m;
    END { print $m + 0 }
  '
}

dwidth() { printf '%s\n' "$1" | maxwidth; }

# Every line of every art, so the text column lands in the same place run to run
all_art_lines() {
  i=1
  while [ $i -le $ART_COUNT ]; do
    n=1
    while [ $n -le 4 ]; do
      eval "printf '%s\n' \"\$ART${i}_LINE${n}\""
      n=$((n + 1))
    done
    i=$((i + 1))
  done
}

ART_COL=$(all_art_lines | maxwidth)
ART_W=$(printf '%s\n' "$ART_LINE1" "$ART_LINE2" "$ART_LINE3" "$ART_LINE4" | maxwidth)
ART_OFF=$(( (ART_COL - ART_W) / 2 ))   # centre a narrow art under that column

# Print one row: art on the left, text on the right, padded to the box width
row() {
  art="$1"
  text="$2"
  art_pad=$((ART_COL - ART_OFF - $(dwidth "$art")))
  tail_pad=$((INNER_WIDTH - 1 - ART_COL - GAP - $(dwidth "$text")))
  printf " ${COLOR_BORDER}│${RESET} %*s${COLOR_MONSTER}%s${RESET}%*s%*s%s%*s${COLOR_BORDER}│${RESET}\n" \
    "$ART_OFF" "" "$art" "$art_pad" "" "$GAP" "" "$text" "$tail_pad" ""
}

RULE=$(printf '%*s' $INNER_WIDTH '' | tr ' ' '-' | sed 's/-/─/g')

printf " ${COLOR_BORDER}┌%s┐${RESET}\n" "$RULE"
row "$ART_LINE1" "${COLOR_TEXT}Welcome back, Your Highness 👾${RESET}"
row "$ART_LINE2" "${COLOR_TIME}$(date '+%Y-%m-%d %H:%M %p')${RESET}"
# row "$ART_LINE3" ""
# row "$ART_LINE4" ""
printf " ${COLOR_BORDER}└%s┘${RESET}\n" "$RULE"
