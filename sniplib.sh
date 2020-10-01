#!/usr/bin/env bash


sl() {

    # N = number of lines to skip when copying the file contents
    # 1 = skip tags line
    # more info: https://stackoverflow.com/questions/604864/print-a-file-skipping-first-x-lines-in-bash
    local N=1

    out=("$(rg "(\"{3}|'{3})[\sa-z0-9]*(\"{3}|'{3})" $1 | fzf --delimiter=:\
    --preview='[[ $(file --mime {1}) =~ binary ]]\
    && echo {1} is a binary file || (bat --style=numbers\
    --color=always {1} || highlight -O ansi -l {1} || coderay {1} ||\
    rougify {1} || cat {1}) 2> /dev/null | head -500' --query="${@:2}"\
    --exit-0 --expect=ctrl-e)")

    key=$(head -1 <<< "$out")

    file=$(head -2 <<< "$out" | tail -1 | cut -d":" -f1)

    # if ctrl-e: edit, else:
    if [ -n "$file" ]; then
        [ "$key" = ctrl-e ] && $EDITOR "$file" || tail -n +$((N+1)) "$file" | clipcopy
    fi

}

clipcopy() {
    if hash pbcopy 2>/dev/null; then
        pbcopy "$@"
    else
        xclip -sel clip "$@"
    fi
}

sl "$@"
