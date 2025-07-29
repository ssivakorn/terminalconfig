# https://github.com/hastinbe/theme-kawasaki
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

## Enable the time to be displayed.
set -g theme_display_time no

## Disable playing the user's current group.
set -g theme_display_group no

# Display the system hostname.
set -g theme_display_hostname yes

## Disable Git-awareness.
set -g theme_display_git yes

## Don't disable jobs indicator.
set -g theme_display_jobs yes

## Always display the jobs indicator, even if there are no jobs.
# set -g theme_display_jobs_always yes

## Hide the current directory read/write indicator.
set -g theme_display_rw no

## Don't display the VirtualEnv prompt.
set -g theme_display_virtualenv yes

## Display the battery
# set -g theme_display_batt yes
# set -g theme_display_batt_icon yes

set -gx fish_prompt_pwd_dir_length 0


## Theme colors
set theme_primary                                   brgreen
set theme_secondary                                 ffcf44
set theme_primary_variant                           0087ff
set theme_secondary_variant                         brgreen
set theme_hilight                                   brblue

set -g theme_color_error                            red
set -g theme_color_user                             087fff
set -g theme_color_superuser                        red
set -g theme_color_host                             1eb980
set -g theme_color_separator                        b15dff
set -g theme_color_normal                           normal
set -g theme_color_time                             $theme_secondary_variant
set -g theme_color_path                             normal
set -g theme_color_prompt                           ff3399
set -g theme_color_virtualenv                       ff8C00
set -g theme_color_status_prefix                    $theme_hilight
set -g theme_color_status_jobs                      $theme_primary
set -g theme_color_status_rw                        $theme_primary
set -g theme_display_group                          no
set -g theme_prompt_segment_separator_color         $theme_primary
set -g theme_prompt_userhost_separator              '@'

set -g __fish_git_prompt_showcolorhints             yes
set -g __fish_git_prompt_show_informative_status    yes

set -g __fish_git_prompt_color_merging              red
set -g __fish_git_prompt_color_branch               brblue
set -g __fish_git_prompt_color_branch_begin         bryellow
set -g __fish_git_prompt_color_branch_end           bryellow
set -g __fish_git_prompt_char_stateseparator        ' '
set -g __fish_git_prompt_char_branch_begin          '['
set -g __fish_git_prompt_char_branch_end            ']'
set -g __fish_git_prompt_color_branch_begin         brblack
set -g __fish_git_prompt_color_branch_end           brblack
set -g __fish_git_prompt_color_branch               $theme_secondary
