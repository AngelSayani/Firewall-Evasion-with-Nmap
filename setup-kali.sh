#!/bin/bash

# Setup script for the Kali attacker machine
cat > /home/kali/commands.sh << 'EOF'
#!/bin/bash

declare -A NMAP_OUTPUTS
NMAP_OUTPUTS["sudo nmap -sT 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds"

NMAP_OUTPUTS["sudo nmap -sS 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds"

NMAP_OUTPUTS["sudo nmap -sN 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00044s latency).
Not shown: 994 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
8080/tcp open|filtered http-proxy
8000/tcp open|filtered http-alt
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 5.64 seconds"

NMAP_OUTPUTS["sudo nmap -sF 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 994 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
8080/tcp open|filtered http-proxy
8000/tcp open|filtered http-alt
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 5.53 seconds"

NMAP_OUTPUTS["sudo nmap -sX 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00041s latency).
Not shown: 994 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
8080/tcp open|filtered http-proxy
8000/tcp open|filtered http-alt
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 5.58 seconds"

NMAP_OUTPUTS["sudo nmap -sS -f 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 994 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
8000/tcp open  http-alt
8080/tcp open  http-proxy
443/tcp  open  https

Nmap done: 1 IP address (1 host up) scanned in 6.12 seconds"

NMAP_OUTPUTS["sudo nmap -sS -ff 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 990 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy
443/tcp  open  https
3306/tcp open  mysql
5432/tcp open  postgresql
6379/tcp open  redis

Nmap done: 1 IP address (1 host up) scanned in 7.72 seconds"

NMAP_OUTPUTS["sudo nmap -sS --source-port 53 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 992 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy
443/tcp  open  https
3306/tcp open  mysql

Nmap done: 1 IP address (1 host up) scanned in 6.73 seconds"

NMAP_OUTPUTS["sudo nmap -sS --source-port 80 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00040s latency).
Not shown: 992 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
8000/tcp open  http-alt
8080/tcp open  http-proxy
443/tcp  open  https
3306/tcp open  mysql
5432/tcp open  postgresql

Nmap done: 1 IP address (1 host up) scanned in 6.84 seconds"

NMAP_OUTPUTS["sudo nmap -sS --source-port 443 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 993 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy
443/tcp  open  https

Nmap done: 1 IP address (1 host up) scanned in 7.12 seconds"

NMAP_OUTPUTS["sudo nmap -sS -f --source-port 443 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 992 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy
443/tcp  open  https
3306/tcp open  mysql

Nmap done: 1 IP address (1 host up) scanned in 8.14 seconds"

NMAP_OUTPUTS["sudo nmap -sS -f --source-port 53 -p- --min-rate 100 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 65529 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 96.43 seconds"

NMAP_OUTPUTS["sudo nmap -sS -D 192.168.1.101,192.168.1.102,ME 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00041s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 6.26 seconds"

NMAP_OUTPUTS["sudo nmap -sV 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00040s latency).
Not shown: 994 filtered tcp ports
PORT     STATE SERVICE  VERSION
21/tcp   open  ftp      vsftpd 3.0.3
22/tcp   open  ssh      OpenSSH 8.2p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp   open  http     Apache httpd 2.4.41 ((Ubuntu))
7777/tcp open  http     Simple HTTP service
8000/tcp open  http     Python 3.8 http.server
8080/tcp open  http     nginx 1.18.0 (Ubuntu)
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Nmap done: 1 IP address (1 host up) scanned in 11.24 seconds"

NMAP_OUTPUTS["sudo nmap -O -f --source-port 80 10.0.0.10"]="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00041s latency).
Not shown: 994 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy
Device type: general purpose
Running: Linux 4.X|5.X
OS CPE: cpe:/o:linux:linux_kernel:4 cpe:/o:linux:linux_kernel:5
OS details: Linux 4.15 - 5.8
Network Distance: 1 hop

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.68 seconds"

NMAP_OUTPUTS["sudo nmap -Pn -sT 10.0.0.10"]="${NMAP_OUTPUTS["sudo nmap -sT 10.0.0.10"]}"
NMAP_OUTPUTS["sudo nmap -Pn -sS 10.0.0.10"]="${NMAP_OUTPUTS["sudo nmap -sS 10.0.0.10"]}"
NMAP_OUTPUTS["sudo nmap -Pn -sN 10.0.0.10"]="${NMAP_OUTPUTS["sudo nmap -sN 10.0.0.10"]}"
NMAP_OUTPUTS["sudo nmap -Pn -sF 10.0.0.10"]="${NMAP_OUTPUTS["sudo nmap -sF 10.0.0.10"]}"
NMAP_OUTPUTS["sudo nmap -Pn -sX 10.0.0.10"]="${NMAP_OUTPUTS["sudo nmap -sX 10.0.0.10"]}"

# Store tcpdump outputs
TCPDUMP_OUTPUT="tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
12:34:56.789012 IP 10.0.0.5.54321 > 10.0.0.10.22: Flags [S], seq 1000000000, win 64240, options [mss 1460,sackOK,TS val 1234567890 ecr 0,nop,wscale 7], length 0
12:34:56.789123 IP 10.0.0.10.22 > 10.0.0.5.54321: Flags [S.], seq 2000000000, ack 1000000001, win 65160, options [mss 1460,sackOK,TS val 1234567890 ecr 1234567890,nop,wscale 7], length 0
12:34:56.790123 IP 10.0.0.5.54322 > 10.0.0.10.80: Flags [F], seq 1000000000, win 64240, length 0
12:34:56.790234 IP 10.0.0.5.54323 > 10.0.0.10.8080: Flags [F], seq 1000000000, win 64240, length 0
12:34:56.790345 IP 10.0.0.5.54324 > 10.0.0.10.21: Flags [F], seq 1000000000, win 64240, length 0
12:34:58.123456 IP 10.0.0.5.54330 > 10.0.0.10.22: Flags [S], seq 1000001000, win 64240, options [mss 1460,sackOK,TS val 1234567895 ecr 0,nop,wscale 7], length 0
12:34:58.123567 IP 10.0.0.10.22 > 10.0.0.5.54330: Flags [S.], seq 2000001000, ack 1000001001, win 65160, options [mss 1460,sackOK,TS val 1234567895 ecr 1234567895,nop,wscale 7], length 0
^C
35 packets captured
42 packets received by filter
0 packets dropped by kernel"

# Function to replace nmap
nmap_func() {
    # Create a string of the command with arguments
    local cmd="sudo nmap $*"
    
    # Check if we have a predefined output for this command
    if [[ -n "${NMAP_OUTPUTS[$cmd]}" ]]; then
        echo "${NMAP_OUTPUTS[$cmd]}"
    else
        # Not an exact match, try to find partial matches where ip address is consistent
        for key in "${!NMAP_OUTPUTS[@]}"; do
            # Create simplified versions of both strings (no datetime, remove extra spaces)
            local simple_key=$(echo "$key" | sed 's/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]/TIMESTAMP/g' | tr -s ' ')
            local simple_cmd=$(echo "$cmd" | tr -s ' ')
            
            if [[ "$simple_cmd" == "$simple_key" ]]; then
                echo "${NMAP_OUTPUTS[$key]}"
                return
            fi
        done
        
        # Default output if no match found
        echo "Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.47 seconds"
    fi
}

# Function to replace tcpdump
tcpdump_func() {
    sleep 2  # Short delay to simulate activity
    echo "$TCPDUMP_OUTPUT"
    exit 0  # Force exit after showing output
}

# Check the command and replace as needed
if [[ "$1" == "nmap" ]]; then
    shift
    nmap_func "$@"
elif [[ "$1" == "tcpdump" ]]; then
    shift
    tcpdump_func "$@"
elif [[ "$0" == *"nmap" ]]; then
    nmap_func "$@"
elif [[ "$0" == *"tcpdump" ]]; then
    tcpdump_func "$@"
fi
EOF

chmod +x /home/kali/commands.sh

# Create wrapper scripts
mkdir -p /home/kali/bin

# Create nmap wrapper
cat > /home/kali/bin/nmap << 'EOF'
#!/bin/bash
/home/kali/commands.sh nmap "$@"
EOF

# Create tcpdump wrapper
cat > /home/kali/bin/tcpdump << 'EOF'
#!/bin/bash
/home/kali/commands.sh tcpdump "$@"
EOF

# Make wrappers executable
chmod +x /home/kali/bin/nmap
chmod +x /home/kali/bin/tcpdump

# Add bin directory to PATH
echo 'export PATH="/home/kali/bin:$PATH"' >> /home/kali/.bashrc

# Create sudo wrapper
cat > /home/kali/bin/sudo << 'EOF'
#!/bin/bash
if [[ "$1" == "nmap" || "$1" == "tcpdump" ]]; then
    /home/kali/commands.sh "$@"
else
    /usr/bin/sudo "$@"
fi
EOF

chmod +x /home/kali/bin/sudo

# Add hosts entry
echo "10.0.0.10 target" | sudo tee -a /etc/hosts

echo "Setup complete! Please run 'exec bash' to activate the environment."
