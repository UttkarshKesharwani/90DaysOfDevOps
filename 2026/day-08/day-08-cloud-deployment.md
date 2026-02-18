

### Part 1: Launch Cloud Instance & SSH Access 

**Step 1: Create a Cloud Instance**

![Launch instance](./screenshots/instance.png)

**Step 2: Connect via SSH**

![Connected via ssh](./screenshots/ssh.png)


### Part 2: Install Docker & Nginx 

**Step 1: Update System**
`apt update`

**Step 2: Install Nginx**
`sudo apt install nginx -y`


**Verify Nginx is running:**
`sudo systemctl status nginx | grep active`

![running status of nginx](./screenshots/status.png)



### Part 3: Security Group Configuration 

![nginx web page](./screenshots/nginx%20page.png)


### Part 4: Extract Nginx Logs (15 minutes)

**Step 1: View Nginx Logs**

![nginx log](./screenshots/nginx log.png)


**Step 2: Save Logs to File**
`scp -r /var/log/`

**Step 3: Download Log File to Your Local Machine**

![nginx web page](./screenshots/scp.png)

