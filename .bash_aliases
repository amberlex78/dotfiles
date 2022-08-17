alias ll='ls -alF --color --group-directories-first'
export PATH=$HOME/.local/share/bin:$PATH

# Docker
---------
if command -v docker >/dev/null 2>&1; then
  alias dps="docker ps --format 'table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}'"
  alias dpsa="docker ps -a --format 'table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}'"
  alias di="docker images"
  alias dn="docker network ls"
  alias dv="docker volume ls"
  alias drmid="docker rmi $(docker images -qf dangling=true)"
fi

# Laravel
---------
# For composer global require laravel/installer
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.config/yarn/bin:$PATH
# Sail
alias sa='[ -f sail ] && bash sail php artisan  bash vendor/bin/sail php artisan'
alias sail='[ -f sail ] && bash sail  bash vendor/bin/sail'
# Artisan
alias pa="php artisan"
