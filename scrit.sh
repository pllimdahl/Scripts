#!/bin/bash

export DISPLAY=:0

# Function to take screenshots
take_screenshot() {
    local timestamp=$(date +%Y%m%d%H%M%S)
    local filename="screenshot_${timestamp}.png"
    scrot "$filename"
    echo "Screenshot saved: $filename"
    echo "$filename" >> screenshot_list.txt
}



# Read the duration from the user
read -p "Enter the duration in minutes: " duration_minutes

# Read the time to start from the user
read -p "Enter the time to start (HH:MM format): " start_time

# Calculate the duration in seconds
duration_seconds=$((duration_minutes * 60))

# Convert start time to timestamp
start_timestamp=$(date -d "$start_time" +%s)

# Calculate the end time
end_timestamp=$((start_timestamp + duration_seconds))

# Get the current timestamp
current_timestamp=$(date +%s)

# Calculate the sleep duration
sleep_duration=$((start_timestamp - current_timestamp))

if [ $sleep_duration -gt 0 ]; then
    echo "Waiting for the specified start time..."
    sleep $sleep_duration
fi


# Start taking screenshots until the end time is reached
while [ $(date +%s) -lt $end_timestamp ]; do
    take_screenshot
    sleep 4
done

# Create a unique name for the zip file
zip_file="screenshots_$(date +%Y%m%d%H%M%S).zip"

# Create a temporary directory to store the screenshots
temp_dir=$(mktemp -d)
screenshot_list="$temp_dir/screenshot_list.txt"

# Move all the screenshots to the temporary directory
mv screenshot_*.png "$temp_dir"

# Create a zip file with the screenshots
zip -r "$zip_file" "$temp_dir"/*

# Clean up temporary files and directory
rm -rf "$temp_dir" screenshot_list.txt

echo "Screenshots saved in $zip_file"
