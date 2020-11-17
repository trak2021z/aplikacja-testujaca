#!/bin/bash

# poza serwerem produkcyjym nie zadziala

set -e 
 
working_dir=$1
lock_file_or_dir="./.update.lock"
cmd_locking="touch ${lock_file_or_dir}"
cmd_check_lock="test -f ${lock_file_or_dir}"
cmd_unlocking="rm -rf ${lock_file_or_dir}"

function is_already_running()
{
  local cmd_check_lock=${1}
  ${cmd_check_lock} |{
    return 1
   }
}

function create_lock()
{   
  local cmd_locking=${1}

  ${cmd_locking} || {
     printf "cannot create lock \n"
     exit 2
   }
}

function remove_lock()
{
  local cmd_unlocking="${1}"
  ${cmd_unlocking} || {
    printf "Cannot unlock\n"
    exit 3
  }
}

trap 'remove_lock "${cmd_unlocking}"' SIGINT SIGTERM

if is_already_running "${cmd_check_lock}"; then
  printf "Cannot acquire lock - another instance is running, exiting \n"
  exit 1
fi

create_lock "${cmd_locking}"
# NIE DOTYKAC NICZEGO POWYZEJ
###############################################################

mkdir -p ./logs
rm -fr ./logs/*

services=$(docker service ls -q)

for service in $services; do
  service_name=$(docker service ls --format "{{.Name}}" --filter "id=$service")
  echo $service_name
  if [[ $service_name == *"test"* ]]; then
    echo $service_name
    docker service logs --tail 100  $service_name >& ./logs/log_$service_name.log 
  fi
done

git add .
git commit -m "Pushing logs at $(date))


##################################################################
remove_lock "${cmd_unlocking}"
