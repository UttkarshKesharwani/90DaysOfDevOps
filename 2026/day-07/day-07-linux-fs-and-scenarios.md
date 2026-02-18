
### Part 1: Linux File System Hierarchy

=> Everything in linux is either file or directory 

  ``` text 
    root@cloudserver-nEVRdNMD:/# ls
    bin  boot  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  snap  srv  sys  tmp  usr  var
  ```

1. Core Directories :-

- `/` (root) :- The starting point of everything 
- `/home` :- It is the home directory of the user, used when i created a new user and then need to go to it folder 
- `/root` :- Place where all the configration for the root user is placed 
- `/etc` :- It is the place where all the configration files lives like ssh, modules, os-release etc. Basically we have C: drive in window where all the configration lives , it is same /etc directory in linux . I used when i have to configure the nginx (editing the ngnix.conf file).
- `/var/log` :- Here var stands for variable , means a  place where we place a file that consistently being changed like logs file.
- `/tmp` :- stands for temporary files ,  where programs store temporary files needed for short-term use. 
- `/bin` :- stand for binaries, all the binaries of the commands that we use like man , cat , touch , mkdir etc are present here 
- `/usr/bin` :- symbolic link for `/bin`


- `ls -l /etc/passwd`

  ``` text 
    root@cloudserver-nEVRdNMD:/usr/bin# ls -l /etc/passwd
    -rw-r--r-- 1 root root 1734 Feb 17 10:43 /etc/passwd
  ```

# `df -h` vs `du -sh` 
   
  - `df -h` (Disk free) :- Question it answers: How much disk space is available on a filesystem? It shows Total disk size, Used space ,Available (free) space ,Filesystem mount points . It Shows space usage of entire partitions.

  - `du -sh <file_path>` (Disk usage) :- Question it answers: How much space is this file or directory actually using?. What it shows : Space used by files and directories

    ``` text 
      root@cloudserver-nEVRdNMD:/# du -sh /var/log
      28M     /var/log
    ```

    ``` text 
      root@cloudserver-nEVRdNMD:/var/log# du -sh /var/log/*
      0       /var/log/README
      4.0K    /var/log/alternatives.log
      0       /var/log/apport.log
      64K     /var/log/apt
      1.2M    /var/log/auth.log
      996K    /var/log/btmp
      16K     /var/log/cloud-init-output.log
      284K    /var/log/cloud-init.log
      4.0K    /var/log/dist-upgrade
      52K     /var/log/dmesg
      52K     /var/log/dmesg.0
      16K     /var/log/dmesg.1.gz
      44K     /var/log/dpkg.log
      25M     /var/log/journal
      196K    /var/log/kern.log
      4.0K    /var/log/landscape
      4.0K    /var/log/lastlog
      4.0K    /var/log/private
      468K    /var/log/syslog
      80K     /var/log/sysstat
      32K     /var/log/unattended-upgrades
      8.0K    /var/log/wtmp
    ``` 
# Looking at a config file in /etc
cat /etc/hostname

  ``` text 
    root@cloudserver-nEVRdNMD:/var/log# cat /etc/os-release
    PRETTY_NAME="Ubuntu 25.04"
    NAME="Ubuntu"
    VERSION_ID="25.04"
    VERSION="25.04 (Plucky Puffin)"
    VERSION_CODENAME=plucky
    ID=ubuntu
    ID_LIKE=debian
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    UBUNTU_CODENAME=plucky
    LOGO=ubuntu-logo
  ```


### Part 2: Scenario-Based Practice (40 minutes)

**Scenario 1: Service Not Starting** 
```
A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order.
```

commands :-

step 1. `systemctl status myapp` :- to check the status of the service 
step 2  `journalctl -u myapp` :- show the error log of service 
step 3  `systemctl start myapp` :- to start the service
step 4  ``systemctl enable --now <service name>`` : start + enable together

**Scenario 2: High CPU Usage** 

 `ps -eo pid,user,%cpu,command --sort=-%cpu | head` :- every process(e) Shows all processes on the system , output format(o) Lets you choose which columns to display

**Scenario 3: Finding Service Logs** 

  `journalctl -u nginx`

**Scenario 4: File Permissions Issue** 

  `ls -l <file_path>` :- check the permission
  `chmod 764 /home/user/backup.sh` :- give the execute permisssion



