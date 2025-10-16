#!/bin/bash

LOGFILE=$1

if [ ! -f "$LOGFILE" ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

echo "Analyzing log file: $LOGFILE"
echo "------------------------------"

total=$(wc -l < "$LOGFILE")

errors=$(grep -c "ERROR" "$LOGFILE")

warnings=$(grep -c "WARNING" "$LOGFILE")

ips=$(grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOGFILE" | sort | uniq)

echo "Total log entries: $total"
echo "Error entries: $errors"
echo "Warning entries: $warnings"
echo

echo "Unique IP addresses found:"
echo "$ips"
echo

read -p "Enter a date to filter logs (YYYY-MM-DD) or leave blank: " filter_date

if [ -n "$filter_date" ]; then
  echo "Logs on $filter_date:"
  grep "^$filter_date" "$LOGFILE"
fi

echo

echo "Log count by type:"
awk '
  {
    count[$3]++
  }
  END {
    for (type in count) {
      print type ": " count[type]
    }
  }
' "$LOGFILE"
