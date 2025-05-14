#!/bin/bash

show_system_info() {
    INFO=$(uname -a; echo; uptime; echo; df -h)
    whiptail --title "System Info" --msgbox "$INFO" 20 80
    echo "[INFO] Viewed system info at $(date)" >> logs/linask.log
}
