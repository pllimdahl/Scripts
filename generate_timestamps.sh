
#!/bin/bash

start_date=$(date +"%s")
end_date=$(date -d "2023-08-14" +"%s")
interval=$((60*60))  # 1 hour in seconds

current_date=$start_date
while [[ $current_date -lt $end_date ]]; do
    formatted_date=$(date -d "@$current_date" +"%Y-%m-%d %H:%M:%S")
    echo $formatted_date
    current_date=$((current_date + interval))
done