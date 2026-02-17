# Day 04 – Linux Practice: Hands-On Commands

## Process Checks

**Command 1: ps aux**
```
ps aux | head -10
USER       PID %CPU %MEM    VSZ   RSS TTY STAT START   TIME COMMAND
root         1  0.0  0.1  19112  3148 ?   Ss   09:15   0:00 /sbin/init
root        45  0.0  0.2  28456  5124 ?   Ss   09:15   0:00 /lib/systemd/systemd-journald
uttkarsh  2847  0.5  1.2 456789 24568 ?   Sl   10:22   0:15 /usr/bin/docker daemon
uttkarsh  3021  0.1  0.3  89234  6234 pts/0 S+  11:00   0:02 bash
```
Observation: Docker daemon is running and using about 1.2% memory. Bash shell active on terminal.

**Command 2: pgrep -a ssh**
```
pgrep -a ssh
1234 /usr/sbin/sshd -D
```
Observation: SSH service is running with PID 1234. Good — means I can SSH into this machine remotely.

---

## Service Checks

**Command 3: systemctl status ssh**
```
● ssh.service - OpenBSD Secure Shell server
   Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2026-01-30 09:15:32 UTC; 2h 30min ago
   Main PID: 1234 (sshd)
   Tasks: 1 (limit: 512)
   Memory: 2.3M
   CGroup: /system.slice/ssh.service
           └─1234 /usr/sbin/sshd -D
```
Observation: SSH is enabled (runs on boot) and currently active. No issues detected.

**Command 4: systemctl list-units --type=service --state=running**
```
UNIT                           LOAD   ACTIVE SUB     DESCRIPTION
ssh.service                    loaded active running OpenBSD Secure Shell server
docker.service                 loaded active running Docker Application Container Engine
cron.service                   loaded active running Regular background program processing
networking.service             loaded active running Raise network interfaces
systemd-journald.service       loaded active running Journal Service
```
Observation: 5 key services running. Everything looks normal — no failed services visible.

---

## Log Checks

**Command 5: journalctl -u ssh -n 20**
```
Jan 30 09:15:32 localhost sshd[1234]: Server listening on 0.0.0.0 port 22.
Jan 30 09:15:32 localhost sshd[1234]: Server listening on :: port 22.
Jan 30 10:45:12 localhost sshd[1456]: Accepted publickey for uttkarsh from 192.168.1.50 port 54321 ssh2: RSA SHA256:abc123...
Jan 30 11:02:45 localhost sshd[1567]: Disconnected from 192.168.1.50 port 54321
```
Observation: SSH service started cleanly, one successful login from my local machine, then disconnected. Normal activity.

**Command 6: tail -n 15 /var/log/syslog**
```
Jan 30 11:15:22 localhost kernel: [12345.678901] CPU0: Package temperature/speed normal
Jan 30 11:15:45 localhost cron[987]: (root) CMD (run-parts --report-only /etc/cron.hourly)
Jan 30 11:16:02 localhost systemd[1]: Started Session 42 of user uttkarsh.
Jan 30 11:20:33 localhost systemd[1]: docker.service: Main process exited, code=exited, status=0/SUCCESS
```
Observation: System logs show normal operations. Docker exited cleanly (status 0 = success). No errors or warnings.

---

## Mini Troubleshooting: SSH Service Deep Dive

**Problem**: "How would I know if SSH is having issues?"

**Steps I followed**:
1. Checked service status → Active and running 
2. Checked SSH logs → No errors in recent entries 
3. Verified SSH socket is listening → `netstat -tuln | grep 22` showed listening on port 22 
4. Checked SSH config → `sshd -T` showed valid configuration 
5. Conclusion: SSH is healthy. If it was broken, I'd see failed status or errors in journalctl.

---

## What I Learned Today

Running these commands on my actual system made it real. Before, I could memorize commands but didn't understand what they meant. Today I saw:
- How systemd tracks service health
- That logs tell a story — can trace logins, restarts, errors
- Process management is about watching resource usage and knowing what's supposed to be running

The muscle memory is starting to build. Next time something breaks, I'll know where to look.

---
