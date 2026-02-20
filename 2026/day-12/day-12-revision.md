

## What to Review

- **Mindset & plan:** :- will Become the solution architect at any cost

- **Processes & services:**

  ``` bash 
    ps aux
    systemctl status nginx
    journalctl -u nginx
  ```

- **File skills:** 

  Revise :- 

  ``` bash 
    echo "hello" >> test.txt
    chmod 755 test.txt
    chown user:group test.txt
    ls -l
    cp file1 file2
    mkdir newfolder
  ```

- **User/group sanity:**

  Revise :-

  ``` bash 
    sudo useradd berlin
    sudo groupadd heist-team
    sudo usermod -aG heist-team berlin
    sudo chown berlin:heist-team file.txt
  ```


## Mini Self-Check 

1) Which 3 commands save you the most time right now, and why?  
=> `&&` , helps me to write multiple command at once

2) How do you check if a service is healthy? List the exact 2–3 commands you’d run first.  
=> 
  ``` bash 
    systemctl status <service_name>
    journalctl -u <service_name>
    systemctl enable --now <service_name>
  ```

3) How do you safely change ownership and permissions without breaking access? Give one example command. 
=> using the chown command 
  `chown [options] user:group <file_path>`

  eg :- `chown -R tokyo:ubuntu /homw/ubunut/devops/`

4) What will you focus on improving in the next 3 days?
=> Learn nginx in deep like, reverse proxy , load balancing , serving static file , filtering and securities 
=> Learn how to write the production level configration file of nginx 
=> Learn SSL/TLS , configure with nginx 
