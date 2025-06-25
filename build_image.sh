#!/bin/sh

RUNTIME=docker

if [ "$1" == "container" ]; then
  RUNTIME="container"
fi

$RUNTIME build -t ai4eh .
