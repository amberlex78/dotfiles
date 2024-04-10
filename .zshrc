# macOS Catalina 10.15.7

PS1="%n %1~ %# "

alias c="clear"
alias ll="gls -lh --color --group-directories-first"
alias la="gls -lha --color --group-directories-first"

# Node
export PATH="/usr/local/opt/node@20/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node@120/lib"
export CPPFLAGS="-I/usr/local/opt/node@20/include"

# export PATH="/usr/local/opt/node@18/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/node@18/lib"
# export CPPFLAGS="-I/usr/local/opt/node@18/include"

# MySQL
export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

# PostgreSQL
export PATH="/usr/local/Cellar/libpq/16.0/bin:$PATH"

# PHP
export PATH="/Applications/MAMP/bin/php/php8.2.0/bin:$PATH"

# Symfony
export PATH="$HOME/.symfony5/bin:$PATH"

# Docker
source /Users/macbookair/.docker/init-zsh.sh || true # Added by Docker Desktop

if [ -f ~/.bash_docker.sh ]; then
  . ~/.bash_docker.sh
fi

# Artisan
alias pa="php artisan"

# Sail
alias   sa='[ -f sail ] && bash sail || bash vendor/bin/sail php artisan'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# Pint
alias pint='[ -f pint ] && php pint || php vendor/bin/pint'
