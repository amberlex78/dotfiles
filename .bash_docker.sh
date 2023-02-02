if command -v docker >/dev/null 2>&1; then

  function dnames-fn {
    for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
    do
      docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
    done
  }

  function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
      IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
      OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
  }

  function drmid-fn {
    imgs=$(docker images -qf dangling=true)
    [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
  }

  function drmce-fn {
    docker rm $(docker ps --all -qf status=exited)
  }


  alias drmid=drmid-fn
  alias drmce=drmce-fn

  alias di="docker images"
  alias dip=dip-fn

  # Regular list
  alias dps="docker ps"
  alias dpsa="docker ps -a"

  # Format list
  alias dpsf="docker ps --format 'table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}'"
  alias dpsaf="docker ps -a --format 'table {{.ID}}\\t{{.Names}}\\t{{.Status}}\\t{{.Ports}}'"
  
  alias drmi="docker rmi"

  alias dnls="docker network ls"
  alias dnrm="docker network rm"
  
  alias dvls="docker volume ls"
  alias dvrm="docker volume rm"

fi
