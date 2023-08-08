#!/bin/bash

# Array of options
options=("Option 1" "Option 2" "Option 3" "Option 4")

# Display the menu
echo "Choose an option:"
for ((i=0; i<${#options[@]}; i++)); do
    echo "$((i+1)). ${options[i]}"
done

# Get user input
read -p "Enter the number of your choice: " choice

# Validate user input
re='^[0-9]+$'
if ! [[ $choice =~ $re ]] || ((choice < 1)) || ((choice > ${#options[@]})); then
    echo "Invalid choice. Please enter a valid number."
    exit 1
fi