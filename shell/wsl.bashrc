export hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
alias setup-proxy="export https_proxy=http://${hostip}:7890 && export http_proxy=http://${hostip}:7890"
alias unset-proxy="unset https_proxy && unset http_proxy"

alias delete-dot="find ./ -name '._*' | parallel -j4 rm"
