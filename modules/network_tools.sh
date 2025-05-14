#!/bin/bash

network_menu() {
    OPTION=$(whiptail --title "Network Tools" --menu "Choose:" 15 60 5 \
        "1" "Ping" \
        "2" "IP Info" \
        "3" "Traceroute" \
        "4" "Back" 3>&1 1>&2 2>&3)

    case $OPTION in
        1) ping_host ;;
        2) show_ip ;;
        3) run_traceroute ;;
    esac
}

ping_host() {
    HOST=$(whiptail --inputbox "Enter host to ping:" 10 50 --title "Ping" 3>&1 1>&2 2>&3)
    OUTPUT=$(ping -c 4 "$HOST")
    whiptail --title "Ping Result" --msgbox "$OUTPUT" 20 70
    echo "[NET] Pinged $HOST at $(date)" >> logs/linask.log
}

show_ip() {
    IP=$(ip a)
    whiptail --title "IP Info" --msgbox "$IP" 25 80
    echo "[NET] Checked IP info at $(date)" >> logs/linask.log
}

run_traceroute() {
    HOST=$(whiptail --inputbox "Enter host for traceroute:" 10 50 3>&1 1>&2 2>&3)
    OUTPUT=$(traceroute "$HOST")
    whiptail --title "Traceroute Result" --msgbox "$OUTPUT" 25 80
    echo "[NET] Ran traceroute to $HOST at $(date)" >> logs/linask.log
}
