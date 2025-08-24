#!/usr/bin/env fish

echo ""
echo "----step1----"
echo ""

wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' 

echo ""
echo "----step2----"
echo ""
wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' \
    | string replace -a '├' '' \
    | string replace -a '─' '' \
    | string replace -a '│' '' \
    | string replace -a '└' '' 


echo ""
echo "----step3----"
echo ""
wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' \
    | string replace -a '├' '' \
    | string replace -a '─' '' \
    | string replace -a '│' '' \
    | string replace -a '└' '' \
    | string match -r '.*\[vol:.*' 

echo -e "\n----step4----\n"
wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' \
    | string replace -a '├' '' \
    | string replace -a '─' '' \
    | string replace -a '│' '' \
    | string replace -a '└' '' \
    | string match -r '.*\[vol:.*' \
    | string replace -r '\s*\[vol:.*$' '' 

echo -e "\n----step5----\n"
wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' \
    | string replace -a '├' '' \
    | string replace -a '─' '' \
    | string replace -a '│' '' \
    | string replace -a '└' '' \
    | string match -r '.*\[vol:.*' \
    | string replace -r '\s*\[vol:.*$' '' \
    | string replace -r '^\s*(\d+)\.' '$1\t'

echo -e "\n----step6----\n"
wpctl status \
    | sed -n '/Sinks:/,/Sources:/p' \
    | string replace -a '├' '' \
    | string replace -a '─' '' \
    | string replace -a '│' '' \
    | string replace -a '└' '' \
    | string match -r '.*\[vol:.*' \
    | string replace -r '\s*\[vol:.*$' '' \
    | string replace -r '^\s*(\d+)\.' '$1\t' \
    | string replace -r '.*?\\*.*?(\\d+).*?(\\w.*$)' '$1\t$2 *'

echo -e "\n----step7----\n"
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

