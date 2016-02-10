#!/bin/bash
unalias ls
export PATH=$PATH:/home/jh1038/bin

alias fd='cd /opt/fencepost/dropbox'
alias ed='cd /usr/pentaho/etl_data'
alias jh='cd /tmp/johnh'
alias ho='cd /home/jh1038'

alias wl='cd /var/log/fencepost-web'
alias al='cd /var/log/fencepost'
alias hl='cd /var/log/httpd'
alias pl='cd /usr/pentaho/logs'
alias jl='cd /home/jh1038/logs'

alias lr='ls -ltr $*'

alias gm='grep $1 fencepost-message.log'
alias gf='grep $1 fencepost.log'

alias co='chown -R jh1038.jh1038 /home/jh1038/logs /tmp/johnh'

alias showhelp='cat ~johnh/bin/readme.txt'

export PATH=$PATH:/tmp/johnh/apache-jmeter-2.11/bin