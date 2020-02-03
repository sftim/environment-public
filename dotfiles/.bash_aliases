#!/bin/bash
alias repotop='cd "$( git repo-top )"'
alias now="date +%Y-%m-%dT%T.%N | sed -e 's/......\$//'"
alias dmesg='dmesg --time-format iso'
alias iotop='sudo -n iotop'
pager() {
    /usr/bin/bat -p "$@" ;
}

sby()
{
    sudo cat "$@" | bat -l yaml
}

alias g_shallowclonemaster='git clone --depth 1 --single-branch --branch master'

alias k_getnodes='kubectl get nodes --show-labels'
alias k_getallpods='kubectl get pods --all-namespaces'
alias k_runningpods='kubectl get pods --field-selector=status.phase=Running'
alias k_getevents='kubectl get events --sort-by=.metadata.creationTimestamp'
alias k_e='kubectl explain'
k_podlabels()
{
    for item in $( kubectl get pod --output=name "$@")
    do
        printf "Labels for %s\n" "$item" | grep --color -E '[^/]+$' && \
            kubectl get "$item" "$@" --output=json | jq -r -S '.metadata.labels | to_entries | .[] | " \(.key)=\(.value)"' 2>/dev/null
        printf "\n"
    done
}
k_podyaml()
{
    kubectl get "pod/$@" -o yaml | bat -p -l yaml
}
