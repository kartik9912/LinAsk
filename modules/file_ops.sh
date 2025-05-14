#!/bin/bash

file_menu() {
    OPTION=$(whiptail --title "File Operations" --menu "Choose:" 15 60 5 \
        "1" "List Files" \
        "2" "Delete File" \
        "3" "Create File" \
        "4" "Back" 3>&1 1>&2 2>&3)

    case $OPTION in
        1) list_files ;;
        2) delete_file ;;
        3) create_file ;;
    esac
}

list_files() {
    FILES=$(ls -lh)
    whiptail --title "Current Directory Files" --msgbox "$FILES" 20 70
}

delete_file() {
    FILE=$(whiptail --inputbox "Enter file name to delete:" 10 50 3>&1 1>&2 2>&3)
    rm -f "$FILE"
    echo "[FILE] Deleted file $FILE at $(date)" >> logs/linask.log
}

create_file() {
    FILE=$(whiptail --inputbox "Enter file name to create:" 10 50 3>&1 1>&2 2>&3)
    touch "$FILE"
    echo "[FILE] Created file $FILE at $(date)" >> logs/linask.log
}
