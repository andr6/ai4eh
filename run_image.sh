#!/bin/sh

RUNTIME=docker

if [ "$1" == "container" ]; then
  RUNTIME="container"
fi

$RUNTIME run --rm -it --env-file env_file -v $(pwd)/workspace:/home/ninja/workshop ai4eh
