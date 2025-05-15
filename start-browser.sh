#!/bin/bash

CONTAINER_NAME="disposable-browser"

# Start the browser container
docker run --rm -d \
  --name $CONTAINER_NAME \
  -p 5800:5800 \
  jlesage/firefox

echo "Disposable Firefox started. Access it at: http://localhost:5800"

# Wait for user input to stop
read -p "Type 'exit' to stop and delete the browser session: " cmd

if [[ "$cmd" == "exit" ]]; then
  echo "Stopping and removing the container..."
  docker stop $CONTAINER_NAME
fi

