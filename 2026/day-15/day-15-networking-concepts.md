


### Task 1: DNS – How Names Become IPs

1️. What happens when you type google.com in a browser?
- Browser checks local DNS cache , if not found, asks OS resolver.
- Resolver queries DNS server .
- DNS hierarchy: Root → TLD (.com) → Authoritative nameserver.
- DNS returns IP address , browser connects to that IP using TCP (usually port 443).

2. What are these record types? Write one line each:
   - `A`, `AAAA`, `CNAME`, `MX`, `NS`

`A` => Maps domain name to IPv4 address.
`AAAA` => Maps domain name to IPv6 address.
`CNAME` => Alias of one domain to another domain.
`MX` => Mail exchange server for receiving emails.
`NS` => Specifies authoritative name servers for the domain.

3. Run: `dig google.com` — identify the A record and TTL from the output
  
  ``` txt
     root@cloudserver-nEVRdNMD:~# dig google.com

      ; <<>> DiG 9.20.11-0ubuntu0.2-Ubuntu <<>> google.com
      ;; global options: +cmd
      ;; Got answer:
      ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47882
      ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

      ;; OPT PSEUDOSECTION:
      ; EDNS: version: 0, flags:; udp: 65494
      ;; QUESTION SECTION:
      ;google.com.                    IN      A

      ;; ANSWER SECTION:
      google.com.             42      IN      A       142.250.183.238

      ;; Query time: 8 msec
      ;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
      ;; WHEN: Fri Feb 20 14:56:21 UTC 2026
      ;; MSG SIZE  rcvd: 55

```

### Task 2: IP Addressing

1. What is an IPv4 address? How is it structured? 

- IPv4 is a 32-bit address written in dotted decimal format.eg, 192.168.1.10. Its structure is  4 octets (8 bits each) → 32 bits total.It ranges from `0.0.0.0` to `255.255.255.255`


2. Difference between **public** and **private** IPs — give one example of each. 

- Public IP is globally routable on the internet, used to find the device
Example: 8.8.8.8
- Private IP, Used inside internal networks , to commuincate over the private network
Example: 192.168.1.10

3. What are the private IP ranges?
   - `10.x.x.x`, `172.16.x.x – 172.31.x.x`, `192.168.x.x`

    10.0.0.0 – 10.255.255.255
    172.16.0.0 – 172.31.255.255
    192.168.0.0 – 192.168.255.255


4. Run: `ip addr show` — identify which of your IPs are private

    ``` text 
        2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
      link/ether 00:16:3e:b5:10:af brd ff:ff:ff:ff:ff:ff
      altname enp0s3
      altname enx00163eb510af
      inet 103.209.147.15/22 brd 103.209.147.255 scope global eth0
        valid_lft forever preferred_lft forever
      inet6 fe80::216:3eff:feb5:10af/64 scope link proto kernel_ll
        valid_lft forever preferred_lft forever
    ```


### Task 3: CIDR & Subnetting

1. What does `/24` mean in `192.168.1.0/24`?
/24 means first 24 bits are network bits. Remaining 8 bits are host bits.Subnet mask: 255.255.255.0


2. How many usable hosts in a `/24`? A `/16`? A `/28`?
  Formula :- 2^(host bits) - 2

  | CIDR | Host Bits | Usable Hosts |
  | ---- | --------- | ------------ |
  | /24  | 8         | 254          |
  | /16  | 16        | 65,534       |
  | /28  | 4         | 14           |

3. Explain in your own words: why do we subnet?
To divide large networks into smaller manageable networks.Improves security. Reduces broadcast traffic. Better IP address utilization.

4. Quick exercise — fill in:

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
| ---- | --------------- | --------- | ------------ |
| /24  | 255.255.255.0   | 256       | 254          |
| /16  | 255.255.0.0     | 65,536    | 65,534       |
| /28  | 255.255.255.240 | 16        | 14           |


### Task 4: Ports – The Doors to Services


1. What is a port? Why do we need them?
=> When the request comes to the machine here IP determine the machine which particual machine requests over internet and the port inside that machine determines from which service requests comes.


2. Document these common ports:

| Port  | Service |
| ----- | ------- |
| 22    | SSH     |
| 80    | HTTP    |
| 443   | HTTPS   |
| 53    | DNS     |
| 3306  | MySQL   |
| 6379  | Redis   |
| 27017 | MongoDB |


3. Run `ss -tulpn` — match at least 2 listening ports to their services

``` txt 

root@cloudserver-nEVRdNMD:~# ss -tulpn
Netid State   Recv-Q  Send-Q   Local Address:Port   Peer Address:Port Process
udp   UNCONN  0       0           127.0.0.54:53          0.0.0.0:*     users:(("systemd-resolve",pid=413,fd=16))
udp   UNCONN  0       0        127.0.0.53%lo:53          0.0.0.0:*     users:(("systemd-resolve",pid=413,fd=14))
tcp   LISTEN  0       511            0.0.0.0:80          0.0.0.0:*     users:(("nginx",pid=869,fd=5),("nginx",pid=867,fd=5),("nginx",pid=866,fd=5))


```s



### Task 5: Putting It Together

- You run `curl http://myapp.com:8080` — what networking concepts from today are involved?
  1. DNS resolve
  2. Connection establishment
  3. Share resources over internet

- Your app can't reach a database at `10.0.1.50:3306` — what would you check first?
  1. ping server , `ping 10.0.1.50`
  2. check the port , `nc -zv 10.0.1.50 3306`
  3. Is MySQL running , `systemctl status mysql`
  4. Firewall/security group rules?
  5. Correct subnet/VPC routing?



What I Learned (3 Key Points)

1. DNS translates human-readable names into IP addresses using hierarchical resolution.
2. CIDR helps divide networks efficiently and calculate usable hosts.
3.Ports allow multiple services to run on the same IP address without conflict.