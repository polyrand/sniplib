#!/usr/bin/env bash


# debug() {
#     out=("$(rg "(\"{3}|'{3})[\sa-z0-9]*(\"{3}|'{3})" snips | fzf --delimiter=:\
#     --preview='[[ $(file --mime {1}) =~ binary ]]\
#     && echo {1} is a binary file || (bat --style=numbers\
#     --color=always {1} || highlight -O ansi -l {1} || coderay {1} ||\
#     rougify {1} || cat {1}) 2> /dev/null | head -500' --query="$1"\
#     --exit-0 --expect=ctrl-e)")
#     echo "$out"
#     key=$(head -1 <<< "$out")
#     echo "k: $key"
#     file=$(head -2 <<< "$out" | tail -1 | cut -d":" -f1)
#     echo "f: $file"
# }


sl() {

    # N = number of lines to skip
    # skip tags line
    # https://stackoverflow.com/questions/604864/print-a-file-skipping-first-x-lines-in-bash
    local N=1

    out=("$(rg "(\"{3}|'{3})[\sa-z0-9]*(\"{3}|'{3})" snips | fzf --delimiter=:\
    --preview='[[ $(file --mime {1}) =~ binary ]]\
    && echo {1} is a binary file || (bat --style=numbers\
    --color=always {1} || highlight -O ansi -l {1} || coderay {1} ||\
    rougify {1} || cat {1}) 2> /dev/null | head -500' --query="$1"\
    --exit-0 --expect=ctrl-e)")

    key=$(head -1 <<< "$out")

    file=$(head -2 <<< "$out" | tail -1 | cut -d":" -f1)
    
    # if ctrl-e: edit, else: 
    if [ -n "$file" ]; then
        [ "$key" = ctrl-e ] && $EDITOR "$file" || tail -n +$((N+1)) "$file" | pbcopy
    fi

}

sl "$1"
