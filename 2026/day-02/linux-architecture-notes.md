# Linux Architecture & Process Management

## Core Linux Components

**Kernel**  
The core that manages hardware, memory, CPU, and I/O. It sits between applications and hardware — handles everything from scheduling tasks to managing disk access.

**User Space**  
Where all applications and user processes run. Includes shells, web servers, databases — basically everything you interact with directly.

**Init / systemd**  
The first process (PID 1) that starts when Linux boots. systemd is the modern init system that manages all other services and processes. It's like the manager of your system — it starts services, restarts them if they crash, and handles dependencies.

---

## Process States (What's happening right now)

**Running** — Process is actively using CPU  
**Sleeping** — Waiting for something (I/O, user input, etc.) — not using CPU  
**Zombie** — Process has finished but parent hasn't cleaned it up yet — weird but happens  
**Stopped** — Paused by a signal, waiting to be resumed  
**Defunct** — Dead process still in process table  

---

## 5 Daily Commands I Use

`ps aux` — See all running processes and what they're doing  
`top` — Real-time view of CPU, memory, and which process is eating resources  
`systemctl status <service>` — Check if a service is running or crashed  
`systemctl restart <service>` — Restart a service that's misbehaving  
`journalctl -u <service> -f` — Follow service logs in real-time to see what went wrong  

---

## Why This Matters for DevOps

When a service crashes at 2am, you need to know: Is it a process issue? Is systemd not restarting it? Are there zombie processes? This knowledge lets you fix issues fast instead of panic-restarting everything.

I learned today that systemd makes life easier — it restarts failed services automatically, manages dependencies, and gives you clean logs. That's powerful.

---

**Date**: February 14, 2026  
**Learner**: Uttkarsh Kesharwani