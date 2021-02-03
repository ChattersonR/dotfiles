source {$HOME}/.alias

if type -q starship
    starship init fish | source
else
#    set normal (set_color normal)
#    set magenta (set_color magenta)
#    set yellow (set_color yellow)
#    set green (set_color green)
#    set red (set_color red)
#    set gray (set_color -o black)

    # Fish git prompt
    set __fish_git_prompt_showdirtystate 'yes'
    set __fish_git_prompt_showstashstate 'yes'
    set __fish_git_prompt_showuntrackedfiles 'yes'
    set __fish_git_prompt_showupstream 'yes'
    set __fish_git_prompt_describe_style 'contains'
    set __fish_git_prompt_showcolorhints 'yes'
    set __fish_git_prompt_color_branch yellow
    set __fish_git_prompt_color_upstream_ahead green
    set __fish_git_prompt_color_upstream_behind red

    function fish_prompt
        set -l last_status $status
        set -l retc red
        test $last_status = 0; and set retc green

        set -l clearclr (set_color normal)
        set -l cwdclr (set_color $fish_color_cwd)
        set -l retclr (set_color $retc)
        printf "[ $cwdclr%s$clearclr ] %s\n$retclr❯$clearclr " (prompt_pwd) (__fish_git_prompt)

        #printf '%s' (__fish_git_prompt)

        #set_color $retc
        #printf '\n> '

        #set_color normal
    end
end

function print_fish_colors --description 'Shows the various fish colors being used'
    set -l clr_list (set -n | grep fish | grep color | grep -v __)
    if test -n "$clr_list"
        set -l bclr (set_color normal)
        set -l bold (set_color --bold)
        printf "\n| %-38s | %-38s |\n" Variable Definition
        echo '|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|'
        for var in $clr_list
            set -l def $$var
            set -l clr (set_color $def ^/dev/null)
            or begin
                printf "| %-38s | %s%-38s%bclr |\n" "$var" (set_color --bold white --background=red) "$def"
                continue
            end
            printf "| $clr%-38s$bclr | $bold%-38s$bclr |\n" "$var" "$def"
        end
        echo '|________________________________________|_________________________________________|'
    end
end

function print_fish_git_icons --description 'Shows the various fish git icons being used'
    set -l clr_list (set -n | grep fish | grep git_prompt_char)
    if test -n "$clr_list"
        set -l bclr (set_color normal)
        set -l bold (set_color --bold)
        printf "\n\ %-38s | %-38s |\n" Variable Definition
        echo '|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|'
        for var in $clr_list
            set -l def $$var
            or begin
                printf "| %-42s | %s%-38s$bclr |\n" "$var" (set_color --bold white --background=red) "$def"
                continue
            end
            printf "| %-42s | $bold%-38s$bclr |\n" "$var" "$def"
        end
        echo '|____________________________________________|_________________________________________|'
    end
end
