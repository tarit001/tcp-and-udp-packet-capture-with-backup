# tcp-and-udp-packet-capture-with-backup
TCP and UDP packet capture with automatic backup 


# TCP & UDP Traffic Monitoring and Automatic Backup

## Overview

This project provides a **Bash-based solution** for capturing TCP and UDP network traffic using `tcpdump`, storing it in log files, and performing **automated backups** at a scheduled time. The scripts also support **manual execution** and universal accessibility from anywhere in the system.

## Features

- **Real-time TCP and UDP Traffic Capture:** Uses `tcpdump` to capture network traffic.
- **Log Storage:** Saves TCP logs in `/root/tcp.txt` and UDP logs in `/root/udp.txt`.
- **Automatic Backups:** Backs up logs to `/opt/` daily at **10:00 PM**.
- **Manual Execution:** Users can trigger scans and backups via a **universal command-line interface**.
- **Cron Job Integration:** Automates scheduled backups via `cron`.

## File Structure

```
/
├── /home/spidy/Documents/dump.sh      # Main script for TCP and UDP scanning
├── /opt/tcp_backup.sh                 # Script for backing up TCP logs
├── /opt/udp_backup.sh                 # Script for backing up UDP logs
└── /usr/local/bin/                     # Universal access links
```

## Script Details

### 1. `dump.sh` (Network Traffic Scanner)

- Continuously scans network traffic.
- Supports both **TCP and UDP** scanning.
- Saves captured traffic to `/root/tcp.txt` (for TCP) and `/root/udp.txt` (for UDP).
- Displays a menu for user interaction.
- Allows the user to exit gracefully by selecting `Q`.

#### Usage:
```sh
dump    # Runs the scanner script (accessible globally)
```

### 2. `tcp_backup.sh` (TCP Log Backup)

- Creates a timestamped backup of `/root/tcp.txt` in `/opt/`.
- Logs backup operations to `/var/log/tcp_backup.log`.
- Can be triggered manually or via `cron`.

#### Usage:
```sh
tcp_backup    # Manually triggers a TCP log backup
```

### 3. `udp_backup.sh` (UDP Log Backup)

- Creates a timestamped backup of `/root/udp.txt` in `/opt/`.
- Logs backup operations to `/var/log/udp_backup.log`.
- Can be triggered manually or via `cron`.

#### Usage:
```sh
udp_backup    # Manually triggers a UDP log backup
```

## Universal Access Setup

To make the scripts accessible from anywhere in the system:

```sh
mv /root/dump.sh /usr/local/bin/dump
chmod u+x /usr/local/bin/dump

mv /opt/tcp_backup.sh /usr/local/bin/tcp_backup
chmod u+x /usr/local/bin/tcp_backup

mv /opt/udp_backup.sh /usr/local/bin/udp_backup
chmod u+x /usr/local/bin/udp_backup
```

Now, you can run:
```sh
dump         # Starts the scanner

tcp_backup   # Backs up TCP logs

udp_backup   # Backs up UDP logs
```
from any location in the terminal.

## Automatic Backup Scheduling

To schedule automatic backups at **10:00 PM every day**, add these cron jobs:

1. Open the crontab editor:
   ```sh
   crontab -e
   ```
2. Add the following lines:
   ```sh
   0 22 * * * /opt/tcp_backup.sh
   0 22 * * * /opt/udp_backup.sh
   ```
3. Save and exit.

These cron jobs will execute the backup scripts at **10:00 PM daily**.

## Logs & Debugging

- Backup logs are stored at:
  - `/var/log/tcp_backup.log` (for TCP backups)
  - `/var/log/udp_backup.log` (for UDP backups)
- If the backup fails, check these logs for errors.

## Requirements

- Linux-based system (Ubuntu, Debian, CentOS, etc.)
- `tcpdump` installed (use `sudo apt install tcpdump` if missing)
- Root or sudo privileges

## Contributing

Feel free to contribute by submitting **issues, feature requests, or pull requests**.

## License

This project is **open-source** under the MIT License.

## Author

**Tarit** 🚀  
GitHub: [https://github.com/tarit001](https://github.com)  
Email: [hackthebox039@gmail.com](mailto:your.email@example.com)

