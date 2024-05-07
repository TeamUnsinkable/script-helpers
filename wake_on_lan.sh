#!/bin/bash

# Define an associative array for client names and their MAC addresses
declare -A clients
clients["Mako Panda LAN1"]="00:A0:C9:00:00:00"
clients["Nautilus Panda LAN1"]="00:E0:4C:06:49:45"

# Function to display the menu and handle user input
function display_menu() {
    echo "Select a client to wake:"
    local i=1
    local options=()
    local key_map=()

    for key in "${!clients[@]}"; do
        echo "$i) $key"
        key_map[$i]="$key"
        ((i++))
    done

    read -p "Enter choice: " choice

    if [[ -n "${key_map[$choice]}" ]]; then
        local selected_name="${key_map[$choice]}"
        wake_client "${clients[$selected_name]}"
    else
        echo "Invalid option, please try again."
    fi
}

# Function to send the magic packet
function wake_client() {
    local mac_address=$1
    echo "Waking up $mac_address..."
    wakeonlan $mac_address
}

# Main script starts here
display_menu

