#!/usr/bin/env fish

#-d,--dmenu
#    dmenu compatibility mode. In this mode, the list entries are
#    read  from  stdin (newline separated). The selected entry is
#    printed to stdout. If the input string does not match any of
#    the entries, the input string is printed as is on stdout.
#
#    Alternatively, you can symlink the fuzzel binary  to  dmenu.
#    Fuzzel  will  then  start in dmenu mode, without the --dmenu
#    argument.
#
#    Fuzzel also supports icons, using Rofi's extended dmenu pro‐
#    tocol. To set an icon for an entry, append  \0icon\x1f<icon-
#    name>. Example:
#
#        echo -en "Firefox\0icon\x1ffirefox" | fuzzel --dmenu

# --accept-nth=N
# Output the N:th column (tab separated) of each input line to
# stdout. dmenu mode only.
# 
# Example:
#     printf "1tFirstn2tSecond" | fuzzel -d --accept-nth=2
# 
# This  will display the entries 1   First and 2   Second. De‐
# pending on which one is selected, First or  Second  will  be
# printed to stdout.
# 
# Setting  it  to 0 is the same as not specifying --accept-nth
# at all.


#So I want: fuzzel --accept-nth=2 with [id]t[name]
#And possible with an icon for default

wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' \
    | string replace -a '├' '' \
    | string replace -a '─' '' \
    | string replace -a '│' '' \
    | string replace -a '└' '' \
    | string match -r '.*\[vol:.*' \
    | string replace -r '\s*\[vol:.*$' '' \
    | string replace -r '^\s*(\d+)\.' '$1\t' \
    | string replace -r '.*?\\*.*?(\\d+).*?(\\w.*$)' '$1\t$2 *' \
    | fuzzel --dmenu --accept-nth=1 \
    | read -l choice; \
    and echo "$choice"
and wpctl set-default "$choice"

#wpctl status \
#    | sed -n '/Sinks:/,/Sources:/p' \
#    | string replace -a '├' '' \
#    | string replace -a '─' '' \
#    | string replace -a '│' '' \
#    | string replace -a '└' '' \
#    | string match -r '.*\[vol:.*' \
#    | string replace -r '\s*\[vol:.*$' '' \
#    | string replace -r '^\s*(\d+)\.' '$1\t' \
#    | string replace -r '.*?\\*.*?(\\d+).*?(\\w.*$)' '$1 $2 *' \
#    | string replace -r '\s+' ' ' \
#    | fuzzel --dmenu \
#    | read -l choice; \
#    and wpctl set-default (string match -r '^\d+' "$choice")
