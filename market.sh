#!/bin/bash

sudo systemctl stop cinemataztic-player

# Array of options
options=("cinemataztic-en" "cinesafun-es" "biospil-dk" "drf-dk" "leffapeli-fi" "finnkino-fi" "itv-in" "mdn-no" "cinemataztic-au" "cinemataztic-nz" "weischer-de" "redyplay-de" "wideeyemedia-ie")
# Display the menu
echo "Choose a market:"
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

selected_option="${options[choice-1]}"

sudo sed -i "s/^DefaultEnvironment=MARKET=.*/DefaultEnvironment=MARKET=$selected_option/" /etc/systemd/system.conf

echo "MARKET environment variable updated to '$selected_option' in /etc/systemd/system.conf"

sleep 3

sudo rm /home/player/conf-db.json
sudo rm -r /home/player/Assets/*

read -p "Do you want to reboot the system now to apply the changes? (y/n): " reboot_choice
if [[ $reboot_choice =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo "Reboot not requested. Exiting script."
fi



