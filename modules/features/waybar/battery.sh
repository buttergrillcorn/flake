#!/usr/bin/env bash
# Smart dual battery indicator for Lenovo T480
# Combines BAT0 (internal, 24Wh) and BAT1 (external, 72Wh) into single percentage
# Returns JSON for waybar

set -euo pipefail

# Battery capacities in Wh (adjust these to match your actual batteries)
BAT0_CAPACITY=24  # Internal battery capacity in Wh
BAT1_CAPACITY=72  # External battery capacity in Wh
TOTAL_CAPACITY=$((BAT0_CAPACITY + BAT1_CAPACITY))

# Read battery info
BAT0_PATH="/sys/class/power_supply/BAT0"
BAT1_PATH="/sys/class/power_supply/BAT1"
AC_PATH="/sys/class/power_supply/AC"

# Check if batteries exist
if [[ ! -d "$BAT0_PATH" || ! -d "$BAT1_PATH" ]]; then
    echo "{\"text\":\"󰂑\",\"tooltip\":\"Battery not found\",\"class\":\"missing\"}"
    exit 0
fi

# Read battery percentages
bat0_percent=$(cat "$BAT0_PATH/capacity" 2>/dev/null || echo "0")
bat1_percent=$(cat "$BAT1_PATH/capacity" 2>/dev/null || echo "0")

# Read battery status
bat0_status=$(cat "$BAT0_PATH/status" 2>/dev/null || echo "Unknown")
bat1_status=$(cat "$BAT1_PATH/status" 2>/dev/null || echo "Unknown")

# Read AC status
ac_online=$(cat "$AC_PATH/online" 2>/dev/null || echo "0")

# Calculate energy remaining in Wh
bat0_energy=$(awk "BEGIN {printf \"%.1f\", $bat0_percent * $BAT0_CAPACITY / 100}")
bat1_energy=$(awk "BEGIN {printf \"%.1f\", $bat1_percent * $BAT1_CAPACITY / 100}")
total_energy=$(awk "BEGIN {printf \"%.1f\", $bat0_energy + $bat1_energy}")

# Calculate combined percentage
combined_percent=$(awk "BEGIN {printf \"%d\", ($total_energy / $TOTAL_CAPACITY) * 100}")

# Read power consumption (in µW)
bat0_power=$(cat "$BAT0_PATH/power_now" 2>/dev/null || echo "0")
bat1_power=$(cat "$BAT1_PATH/power_now" 2>/dev/null || echo "0")
total_power_uw=$((bat0_power + bat1_power))
total_power_w=$(awk "BEGIN {printf \"%.2f\", $total_power_uw / 1000000}")  # Convert to W

# Determine charging state
if [[ "$ac_online" == "1" ]]; then
    if [[ "$bat0_status" == "Charging" || "$bat1_status" == "Charging" ]]; then
        charging=true
        state="Charging"
    elif [[ "$bat0_status" == "Full" && "$bat1_status" == "Full" ]]; then
        charging=false
        state="Full"
    else
        charging=false
        state="Plugged"
    fi
else
    charging=false
    state="Discharging"
fi

# Select icon based on combined percentage and charging state
if [[ "$charging" == true ]]; then
    if [[ $combined_percent -ge 90 ]]; then icon="󰂅"
    elif [[ $combined_percent -ge 80 ]]; then icon="󰂋"
    elif [[ $combined_percent -ge 70 ]]; then icon="󰂊"
    elif [[ $combined_percent -ge 60 ]]; then icon="󰢞"
    elif [[ $combined_percent -ge 50 ]]; then icon="󰂉"
    elif [[ $combined_percent -ge 40 ]]; then icon="󰢝"
    elif [[ $combined_percent -ge 30 ]]; then icon="󰂈"
    elif [[ $combined_percent -ge 20 ]]; then icon="󰂇"
    elif [[ $combined_percent -ge 10 ]]; then icon="󰂆"
    else icon="󰢜"
    fi
elif [[ "$state" == "Full" ]]; then
    icon="󰂅"
elif [[ "$state" == "Plugged" ]]; then
    icon="󰚥"
else
    if [[ $combined_percent -ge 90 ]]; then icon="󰁹"
    elif [[ $combined_percent -ge 80 ]]; then icon="󰂂"
    elif [[ $combined_percent -ge 70 ]]; then icon="󰂁"
    elif [[ $combined_percent -ge 60 ]]; then icon="󰂀"
    elif [[ $combined_percent -ge 50 ]]; then icon="󰁿"
    elif [[ $combined_percent -ge 40 ]]; then icon="󰁾"
    elif [[ $combined_percent -ge 30 ]]; then icon="󰁽"
    elif [[ $combined_percent -ge 20 ]]; then icon="󰁼"
    elif [[ $combined_percent -ge 10 ]]; then icon="󰁻"
    else icon="󰁺"
    fi
fi

# Determine CSS class for styling
if [[ $combined_percent -le 10 ]]; then
    class="critical"
elif [[ $combined_percent -le 20 ]]; then
    class="warning"
elif [[ "$charging" == true ]]; then
    class="charging"
else
    class="normal"
fi

# Calculate time remaining
if [[ "$state" == "Discharging" ]] && (( $(echo "$total_power_w > 0.5" | awk '{print ($1 > 0.5)}') )); then
    time_hours=$(awk "BEGIN {printf \"%.2f\", $total_energy / $total_power_w}")
    hours=$(awk "BEGIN {printf \"%d\", int($time_hours)}")
    minutes=$(awk "BEGIN {printf \"%d\", int(($time_hours - $hours) * 60)}")
    time_remaining="${hours}h ${minutes}m remaining"
elif [[ "$state" == "Charging" ]] && (( $(echo "$total_power_w > 0.5" | awk '{print ($1 > 0.5)}') )); then
    energy_to_full=$(awk "BEGIN {printf \"%.2f\", $TOTAL_CAPACITY - $total_energy}")
    time_hours=$(awk "BEGIN {printf \"%.2f\", $energy_to_full / $total_power_w}")
    hours=$(awk "BEGIN {printf \"%d\", int($time_hours)}")
    minutes=$(awk "BEGIN {printf \"%d\", int(($time_hours - $hours) * 60)}")
    time_remaining="${hours}h ${minutes}m until full"
else
    time_remaining=""
fi

# Build tooltip
tooltip="Combined: ${combined_percent}% (${total_energy}Wh)"
[[ -n "$time_remaining" ]] && tooltip+="\n${time_remaining}"
tooltip+="\nPower: ${total_power_w}W\n"
tooltip+="BAT1 (External): ${bat1_percent}% (${bat1_energy}Wh) - ${bat1_status}\n"
tooltip+="BAT0 (Internal): ${bat0_percent}% (${bat0_energy}Wh) - ${bat0_status}\n"
tooltip+="Status: ${state}"

# Return JSON
echo "{\"text\":\"${icon}\",\"tooltip\":\"${tooltip}\",\"class\":\"${class}\",\"percentage\":${combined_percent}}"
