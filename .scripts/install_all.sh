#!/bin/bash

for file in install; do
  if [ -x "$file" ]; then  # Check if the file is executable
    ./"$file"  # Execute the file
  fi
done
