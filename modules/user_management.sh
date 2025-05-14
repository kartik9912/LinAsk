#!/bin/bash

user_menu() {
    OPTION=$(whiptail --title "User Management" --menu "Choose:" 15 60 5 \
        "1" "Add User" \
        "2" "Delete User" \
        "3" "List Users" \
        "4" "Back" 3>&1 1>&2 2>&3)

    case $OPTION in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
    esac
}

add_user() {
    USERNAME=$(whiptail --inputbox "Enter username to add:" 10 50 3>&1 1>&2 2>&3)
    sudo adduser "$USERNAME"
    echo "[USER] Added user $USERNAME at $(date)" >> logs/linask.log
}

delete_user() {
    USERNAME=$(whiptail --inputbox "Enter username to delete:" 10 50 3>&1 1>&2 2>&3)
    sudo deluser "$USERNAME"
    echo "[USER] Deleted user $USERNAME at $(date)" >> logs/linask.log
}

list_users() {
    USERS=$(cut -d: -f1 /etc/passwd)
    whiptail --title "Users List" --msgbox "$USERS" 20 60
}
