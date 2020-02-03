#!/bin/bash
alias repotop='cd "$( git repo-top )"'
alias now="date +%Y-%m-%dT%T.%N | sed -e 's/......\$//'"
alias dmesg='dmesg --time-format iso'
alias iotop='sudo -n iotop'
alias kevents='kubectl get events --sort-by=.metadata.creationTimestamp --watch'
alias colourfind="bfs '!' '(' -name .git -prune -false ')' --"
colourdiff() {
    command git diff --word-diff=color --no-index --word-diff-regex=. "$1" "$2" | tail -n +6
}
sby()
{
    pkexec cat "$@" | bat -l yaml
}
