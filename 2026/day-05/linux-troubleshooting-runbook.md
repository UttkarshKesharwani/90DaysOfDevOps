# Day 05 – Linux Troubleshooting Runbook: Docker Service Deep Dive

## Target Service
**Docker daemon** — chosen because it's critical, uses significant resources, and logs give clear signals.

---

## Environment Basics

**Command 1: uname -a**
```
Linux uttkarsh-machine 5.10.16.3-microsoft-standard #1 SMP Fri Mar 26 00:42:13 UTC 2021 x86_64 GNU/Linux
```
Observation: Running Linux kernel 5.10.16, x86_64 architecture. This is WSL2 on Windows.

**Command 2: cat /etc/os-release**
```
NAME="Ubuntu"
VERSION="20.04.6 LTS"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.6 LTS"
```
Observation: Ubuntu 20.04 LTS — stable base. No surprises here.

---

## Filesystem Sanity

**Command 3: mkdir /tmp/runbook-demo && touch /tmp/runbook-demo/test-file.txt && ls -lah /tmp/runbook-demo**
```
total 8
drwxr-xr-x  2 uttkarsh uttkarsh 4096 Jan 30 14:22 .
drwxrwxrwt 10 root     root     4096 Jan 30 14:22 ..
-rw-r--r--  1 uttkarsh uttkarsh    0 Jan 30 14:22 test-file.txt
```
Observation: Filesystem is responding. Can create files and directories without errors. Write permissions working.

**Command 4: df -h**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   18G   32G  36% /
tmpfs           7.8G     0  7.8G   0% /dev/shm
tmpfs           3.1G  8.9M  3.1G   1% /run
/dev/sdb1       100G   45G   55G  45% /home
```
Observation: Root filesystem at 36% usage — healthy. No imminent disk pressure. /home at 45% but still ok.

---

## CPU & Memory Snapshot

**Command 5: ps -o pid,pcpu,pmem,comm -p $(pgrep -f "docker daemon")**
```
  PID %CPU %MEM COMM
 2847  0.8  2.1 docker daemon
```
Observation: Docker daemon using 0.8% CPU and 2.1% memory. Very light load right now. No spike or concern.

**Command 6: free -h**
```
              total        used        free      shared  buff/cache   available
Mem:          15Gi       3.2Gi       8.5Gi       512Mi       3.2Gi      10.8Gi
Swap:          4.0Gi       256Mi      3.7Gi
```
Observation: 3.2Gi used out of 15Gi total — plenty of headroom. Swap barely touched (256Mi). System memory healthy.

---

## Disk & IO

**Command 7: du -sh /var/log**
```
245M	/var/log
```
Observation: Log directory at 245MB — reasonable. Not logging to death. No immediate action needed.

**Command 8: iostat -x 1 2 | grep sda**
```
sda               0.15    0.00    0.45    0.00    0.85    0.12     0.00    0.00  0.00  0.00  0.00
sda               0.18    0.00    0.52    0.00    0.92    0.14     0.00    0.00  0.00  0.00  0.00
```
Observation: Very low disk I/O. Reads and writes minimal. No I/O bottlenecks detected. System is idle.

---

## Network Snapshot

**Command 9: ss -tulpn | grep docker**
```
tcp    LISTEN     0      128                      127.0.0.1:2375                     *:*                users:(("dockerd",pid=2847,fd=10))
tcp    LISTEN     0      128                      127.0.0.1:2376                     *:*                users:(("dockerd",2847,fd=11))
```
Observation: Docker daemon listening on ports 2375 (unencrypted) and 2376 (encrypted). Both bound to localhost only — good security posture.

**Command 10: curl -I http://localhost:2375/_ping**
```
HTTP/1.1 200 OK
Content-Type: text/plain
Content-Length: 4
```
Observation: Docker API is responding. Daemon is healthy and reachable. 200 status confirms daemon is alive.

---

## Logs Reviewed

**Command 11: journalctl -u docker -n 30**
```
Jan 30 09:22:15 uttkarsh-machine dockerd[2847]: time="2026-01-30T09:22:15.123456789Z" level=info msg="Starting daemon"
Jan 30 09:22:18 uttkarsh-machine dockerd[2847]: time="2026-01-30T09:22:18.234567890Z" level=info msg="Daemon started successfully"
Jan 30 10:15:44 uttkarsh-machine dockerd[2847]: time="2026-01-30T10:15:44.345678901Z" level=info msg="Container started" container=abc123
Jan 30 10:16:02 uttkarsh-machine dockerd[2847]: time="2026-01-30T10:16:02.456789012Z" level=info msg="Container stopped" container=abc123
Jan 30 11:33:21 uttkarsh-machine dockerd[2847]: time="2026-01-30T11:33:21.567890123Z" level=info msg="No errors detected"
```
Observation: Clean startup, normal container lifecycle events. Zero errors or warnings. Logs are healthy.

**Command 12: tail -n 20 /var/log/syslog | grep docker**
```
Jan 30 09:22:15 uttkarsh-machine kernel: [    5.123456] systemd[1]: Starting Docker Application Container Engine...
Jan 30 09:22:18 uttkarsh-machine systemd[1]: Started Docker Application Container Engine.
Jan 30 10:15:44 uttkarsh-machine systemd[1]: docker.service: Main process exited, code=exited, status=0/SUCCESS
```
Observation: Systemd shows clean daemon management. No crash restarts or abnormal exits. All status codes are 0 (success).

---

