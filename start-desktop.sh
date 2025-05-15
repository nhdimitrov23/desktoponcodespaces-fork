#!/bin/bash

CONTAINER_NAME="disposable-desktop"

# Start the desktop container (auto-removes on stop)
docker run --rm -d \
  --name $CONTAINER_NAME \
  -p 6080:80 \
  dorowu/ubuntu-desktop-lxde-vnc

echo "Ubuntu desktop started. Access it at: http://localhost:6080"

# Wait for user input to stop
read -p "Type 'exit' to stop and delete the desktop session: " cmd

if [[ "$cmd" == "exit" ]]; then
  echo "Stopping and deleting the container..."
  docker stop $CONTAINER_NAME
fi

