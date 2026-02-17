# Linux Commands Cheatsheet

## Process Management

`ps aux` — List all running processes with details  
`top` — View real-time process usage and system stats  
`kill <PID>` — Terminate a process by its ID  
`kill -9 <PID>` - force kill
`killall <process-name>` — Kill all instances of a process  
`bg` — Run a stopped job in background  
`fg` — Bring background job to foreground  
`jobs` — List all background jobs  
`nice -n <priority> <command>` — Start process with custom priority  
`systemctl status <service>` — Check service status  
`systemctl restart <service>` — Restart a systemd service  

## File System

`ls -lah` — List files with details and hidden files  
`cd <path>` — Change directory  
`pwd` — Print current working directory  
`mkdir -p <path>` — Create directory and parent folders  
`cp -r <source> <dest>` — Copy files recursively  
`mv <source> <dest>` — Move or rename files  
`rm -rf <path>` — Remove files/folders recursively  
`find / -name <filename>` — Search for files by name  
`du -sh <path>` — Check directory size  
`df -h` — View disk space usage  
`tail -f <logfile>` — Follow log file in real-time  
`grep <pattern> <file>` — Search for text in files  

## Networking Troubleshooting

`ping <host>` — Test connectivity to a host  
`ip addr show` — Display network interface addresses  
`ip route show` — View routing table  
`netstat -tuln` — Check listening ports  
`ss -tuln` — Modern alternative to netstat  
`curl -I <url>` — Fetch HTTP headers from a URL  
`dig <domain>` — Query DNS records  
`nslookup <domain>` — Look up IP address of domain  
`traceroute <host>` — Trace network path to host  
`ifconfig` — View network interface config (older systems)  
`hostname -i` - give yout the public ip

---

Notes  
These are the commands I use most during troubleshooting. I've tested each one on my system and understand what it does. I'll add more as I encounter new problems in real work.