#!/bin/bash

show_logs() {
    LOG=$(cat logs/linask.log)
    whiptail --title "Activity Logs" --msgbox "$LOG" 25 80
}
