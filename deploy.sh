#!/bin/sh

# TODO: Change mock deployment to actual deployment on a free server.
SUCCESS=$((( RANDOM % 2 )))

if [ "$SUCCESS" -eq "1" ]; then
  echo "SUCCESS";
  exit 0
else
  echo "FAIL";
  exit 1
fi
