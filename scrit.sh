#!/bin/bash

# Function to take screenshots
take_screenshot() {
    local timestamp=$(date +%Y%m%d%H%M%S)
    local filename="screenshot_${timestamp}.png"
    scrot "$filename"
    echo "Screenshot saved: $filename"
}

# Read the duration from the user
read -p "Enter the duration in seconds: " duration

# Start taking screenshots for the specified duration
echo "Taking screenshots for $duration seconds..."
end_time=$((SECONDS + duration))

while [ $SECONDS -lt $end_time ]; do
    take_screenshot
    sleep 1
done

echo "Screenshot capture completed!"
