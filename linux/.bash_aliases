
# Redefine 
alias ll='ls -lF --color --group-directories-first'
alias la='ls -alF --color --group-directories-first'

export PATH=$HOME/.local/share/bin:$PATH


# Laravel 

# For composer global require laravel/installer
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.config/yarn/bin:$PATH

# Sail
alias sa='[ -f sail ] && bash sail || bash vendor/bin/sail php artisan'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# Artisan
alias pa="php artisan"

# Pint
alias pint='[ -f pint ] && php pint || php vendor/bin/pint'