# http_proxy=192.168.2.101:3128  https_proxy=192.168.2.101:3128 no_proxy=code.byted.org

http_proxy_host=192.168.2.101:3128

function within_http_proxy {
    ( export http_proxy=$http_proxy_host https_proxy=$http_proxy_host;
       "$@"
   )
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function shortpath {
    p=${PWD/#'/home/pi'/'~'}
    p=${p/#'~/Projects/xhd2015'/'$X'}
    echo -n "$p"
}
U_APPLE=$(echo -ne '\xef\xa3\xbf')
U_STRAWBERRY=$(echo -ne '\xf0\x9f\x8d\x93')
U_PENGUIN=$(echo -ne '\xf0\x9f\x90\xa7')
PS1='\u@pi \[\e[33m\]$(shortpath)\[\033[32m\]$(parse_git_branch)\[\033[00m\] \t \n$U_STRAWBERRY '
# PS1='\u@pi \[\e[33m\]$(shortpath)\[\033[32m\]$(parse_git_branch)\[\033[00m\] \[\e[31m\]$(ps_todos) TODOs, $(ps_todos_now) DOING\[\e[37m\] \t \n$PENGUIN '
