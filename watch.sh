#!/bin/bash

output_file="output.txt"
command="YOUR COMMAND HERE"

# Function to get the current timestamp
get_timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Run the command in a loop
while true; do
  # Execute the command and capture the output
  output=$(eval "$command")

  # Get the current timestamp
  timestamp=$(get_timestamp)

  # Append the timestamp and output to the file
  echo "[$timestamp] $output" >> "YOUR OUTPUT FILE HERE"

  # Wait for 2 seconds before the next iteration
  sleep 2
done