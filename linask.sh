#!/bin/bash

# Load modules
source modules/system_info.sh
source modules/network_tools.sh
source modules/user_management.sh
source modules/file_ops.sh
source modules/logs.sh

# Create logs directory if not exists
mkdir -p logs

# Main menu loop
while true; do
    CHOICE=$(whiptail --title "LinAsk - Linux Personal Assistant" \
        --menu "Choose a task:" 20 60 10 \
        "1" "System Information" \
        "2" "Network Tools" \
        "3" "User Management" \
        "4" "File Operations" \
        "5" "View Logs" \
        "6" "Exit" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1) show_system_info ;;
        2) network_menu ;;
        3) user_menu ;;
        4) file_menu ;;
        5) show_logs ;;
        6) exit 0 ;;
    esac
done
