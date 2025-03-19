# Description: Docker related functions and aliases
if command -v docker >/dev/null 2>&1; then

  # List IP addresses of running containers
  function dnames-fn {
    for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
    do
      docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
    done
  }

  # List IP addresses of running containers
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

  # Remove dangling images
  function drmid-fn {
    imgs=$(docker images -qf dangling=true)
    [ ! -z "$imgs" ] && docker rmi $imgs || echo "no dangling images."
  }

  # Remove all exited containers
  function drmce-fn {
    docker rm $(docker ps --all -qf status=exited)
  }

  # Remove all containers
  function drmcr-fn {
    docker rm -f $(docker ps -aq)
  }

  ########################################
  # Aliases
  ########################################

  # Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.
  alias dprune="docker system prune -a"  

  alias drmid=drmid-fn  # Remove dangling images
  alias drmce=drmce-fn  # Remove all exited containers
  alias drmcr=drmcr-fn  # Remove all containers

  alias di="docker images"  # List images
  alias dip=dip-fn          # List IP addresses of running containers
  
  alias dps="docker ps"      # List running containers
  alias dpsa="docker ps -a"  # List all containers

  
  alias dpsf="docker ps --format 'table {{.ID}}\\t{{.Image}}\\t{{.Names}}\\t{{.Ports}}'"      # Format list
  alias dpsaf="docker ps -a --format 'table {{.ID}}\\t{{.Image}}\\t{{.Names}}\\t{{.Ports}}'"  # Format list all
  
  alias drmi="docker rmi"  # Remove image
  alias drm="docker rm"    # Remove container

  alias dnls="docker network ls"  # List networks
  alias dnrm="docker network rm"  # Remove network
  
  alias dvls="docker volume ls"  # List volumes
  alias dvrm="docker volume rm"  # Remove volume

fi
