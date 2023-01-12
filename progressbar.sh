#!/bin/bash

# Create an array of commands
commands=("sleep 5" "sleep 5")

# Set the counter
counter=0

for command in "${commands[@]}"; do
    # Run the command
    $command &
    pid=$!
    while kill -0 $pid 2> /dev/null; do
        case $((counter % 4)) in
            0) printf "\r\033[0;35m -" ;;
            1) printf "\r\033[0;35m \\" ;;
            2) printf "\r\033[0;35m |" ;;
            3) printf "\r\033[0;35m /" ;;
        esac
        counter=$((counter+1))
        sleep 0.2
    done
    counter=0
done

# Clear the progress line
printf "\033[2K"

# Show a message indicating that all commands have completed
printf "\n\033[0;35m Script ended successfully.\n"
