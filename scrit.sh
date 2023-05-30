#!/bin/bash

# Function to take screenshots
take_screenshot() {
    local timestamp=$(date +%Y%m%d%H%M%S)
    local filename="screenshot_${timestamp}.png"
    scrot "$filename"
    echo "Screenshot saved: $filename"
    echo "$filename" >> screenshot_list.txt
}

# Read the duration from the user
read -p "Enter the duration in seconds: " duration

# Start taking screenshots for the specified duration
echo "Taking screenshots for $duration seconds..."
end_time=$((SECONDS + duration))

# Create a temporary directory to store the screenshots
temp_dir=$(mktemp -d)
screenshot_list="$temp_dir/screenshot_list.txt"

while [ $SECONDS -lt $end_time ]; do
    take_screenshot
    sleep 1
done

# Create a zip file with the screenshots
zip_file="screenshots.zip"
zip -r "$zip_file" "$temp_dir"/*

# Clean up temporary files and directory
rm -rf "$temp_dir"

echo "Screenshots saved in $zip_file"
