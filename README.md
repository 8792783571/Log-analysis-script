Log File Analyzer

This repository contains a Bash script to analyze log files. The script processes a log file to provide:

- Total number of log entries
- Number of ERROR and WARNING entries
- Unique IP addresses found in the logs
- Optionally filter logs by a specific date
- Count of log entries by type (INFO, ERROR, WARNING, etc.)

Files

- `application.sh`: The main Bash script to analyze the log file.
- `sample.log`: Sample log file to test the script.

Usage

Make sure the script is executable:

```bash
chmod +x application.sh
