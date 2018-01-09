# --------------------------

# DOCKER MACHINE (Docker) ,,
# --------------------------

DOCKER_MACHINE="default"

alias docker-init="docker-machine start ${DOCKER_MACHINE} && sleep 3 && docker-setup"
alias docker-stop="docker-machine stop ${DOCKER_MACHINE} && sleep 1"
alias docker-setup='eval "$(docker-machine env ${DOCKER_MACHINE})"'

if docker-machine status $DOCKER_MACHINE | grep "Running" &> /dev/null
  then
    eval "$(docker-machine env $DOCKER_MACHINE)"
fi