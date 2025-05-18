#!/bin/bash

# Setup script for the Kali attacker machine

mkdir -p /home/kali/bin

# Create the nmap wrapper script
cat > /home/kali/bin/nmap << 'EOF'
#!/bin/bash

# Save the output file path if specified with -oN
OUTPUT_FILE=""
if [[ "$*" == *"-oN"* ]]; then
    for ((i=1; i<=$#; i++)); do
        if [[ "${!i}" == "-oN" ]]; then
            next=$((i+1))
            if [[ $next -le $# ]]; then
                OUTPUT_FILE="${!next}"
            fi
            break
        fi
    done
fi

# This checks if the command is targeting our specific IP
if [[ "$*" == *"10.0.0.10"* ]]; then
    # Default timestamp for all outputs
    TIMESTAMP=$(date +'%Y-%m-%d %H:%M')
    
    # Parse the command to determine the exact scan type
    # Standard TCP connect scan
    if [[ "$*" == *"-sT"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds"
    
    # SYN scan
    elif [[ "$*" == *"-sS"* && "$*" == *"-f"* && "$*" == *"--source-port 443"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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

Nmap done: 1 IP address (1 host up) scanned in 8.14 seconds"
    
    # Full port scan with evasion
    elif [[ "$*" == *"-p-"* && "$*" == *"-f"* && "$*" == *"--source-port 53"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Decoy scan
    elif [[ "$*" == *"-D"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
Nmap scan report for 10.0.0.10
Host is up (0.00041s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 6.26 seconds"
    
    # Fragmentation options -ff (increased fragmentation)
    elif [[ "$*" == *"-ff"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Fragmentation options -f
    elif [[ "$*" == *"-f"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Source port 80 (HTTP)
    elif [[ "$*" == *"--source-port 80"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Source port 53 (DNS)
    elif [[ "$*" == *"--source-port 53"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Source port 443 (HTTPS)
    elif [[ "$*" == *"--source-port 443"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # SYN scan (basic)
    elif [[ "$*" == *"-sS"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds"
    
    # NULL scan
    elif [[ "$*" == *"-sN"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # FIN scan
    elif [[ "$*" == *"-sF"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Xmas scan
    elif [[ "$*" == *"-sX"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Version detection scan
    elif [[ "$*" == *"-sV"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # OS detection scan
    elif [[ "$*" == *"-O"* ]]; then
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
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
    
    # Default response for any other Nmap command
    else
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $TIMESTAMP UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.47 seconds"
    fi
    
    # Print the result to standard output
    echo "$RESULT"
    
    # Save to file if requested
    if [[ -n "$OUTPUT_FILE" ]]; then
        echo "$RESULT" > "$OUTPUT_FILE"
    fi
else
    # If not targeting our lab IP, run the real nmap command
    /usr/bin/nmap "$@"
fi
EOF

# Create the tcpdump wrapper script
cat > /home/kali/bin/tcpdump << 'EOF'
#!/bin/bash

# This checks if the command is targeting our specific IP
if [[ "$*" == *"10.0.0.10"* ]]; then
    # Output for packet capture tool
    echo "tcpdump: verbose output suppressed, use -v[v]... for full protocol decode"
    echo "listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes"
    
    # Start printing packet captures
    echo "12:34:56.789012 IP 10.0.0.5.54321 > 10.0.0.10.22: Flags [S], seq 1000000000, win 64240, options [mss 1460,sackOK,TS val 1234567890 ecr 0,nop,wscale 7], length 0"
    echo "12:34:56.789123 IP 10.0.0.10.22 > 10.0.0.5.54321: Flags [S.], seq 2000000000, ack 1000000001, win 65160, options [mss 1460,sackOK,TS val 1234567890 ecr 1234567890,nop,wscale 7], length 0"
    
    # Determine packet types based on last run nmap command from history
    LAST_NMAP=$(history | grep nmap | tail -n 1)
    
    # Check for specific scan types in history
    if [[ "$LAST_NMAP" == *"-sF"* ]]; then
        # For FIN scans
        echo "12:34:56.790123 IP 10.0.0.5.54322 > 10.0.0.10.80: Flags [F], seq 1000000000, win 64240, length 0"
        echo "12:34:56.790234 IP 10.0.0.5.54323 > 10.0.0.10.8080: Flags [F], seq 1000000000, win 64240, length 0"
        echo "12:34:56.790345 IP 10.0.0.5.54324 > 10.0.0.10.21: Flags [F], seq 1000000000, win 64240, length 0"
    elif [[ "$LAST_NMAP" == *"-sN"* ]]; then
        # For NULL scans
        echo "12:34:56.790345 IP 10.0.0.5.54324 > 10.0.0.10.80: Flags [], seq 1000000000, win 64240, length 0"
        echo "12:34:56.790456 IP 10.0.0.5.54325 > 10.0.0.10.8080: Flags [], seq 1000000000, win 64240, length 0"
        echo "12:34:56.790567 IP 10.0.0.5.54326 > 10.0.0.10.21: Flags [], seq 1000000000, win 64240, length 0"
    elif [[ "$LAST_NMAP" == *"-sX"* ]]; then
        # For Xmas scans
        echo "12:34:56.790567 IP 10.0.0.5.54326 > 10.0.0.10.80: Flags [FPU], seq 1000000000, win 64240, length 0"
        echo "12:34:56.790678 IP 10.0.0.5.54327 > 10.0.0.10.8080: Flags [FPU], seq 1000000000, win 64240, length 0"
        echo "12:34:56.790789 IP 10.0.0.5.54328 > 10.0.0.10.21: Flags [FPU], seq 1000000000, win 64240, length 0"
    elif [[ "$LAST_NMAP" == *"-f"* ]]; then
        # For fragmented packets
        echo "12:34:56.790123 IP 10.0.0.5 > 10.0.0.10: ip-proto-6 40"
        echo "12:34:56.790234 IP 10.0.0.5 > 10.0.0.10: ip-proto-6 40"
        echo "12:34:56.790345 IP 10.0.0.5 > 10.0.0.10: ip-proto-6 40"
        echo "12:34:56.790456 IP 10.0.0.5 > 10.0.0.10: ip-proto-6 40"
    elif [[ "$LAST_NMAP" == *"--source-port 53"* ]]; then
        # DNS source port
        echo "12:34:56.791234 IP 10.0.0.5.53 > 10.0.0.10.80: Flags [S], seq 1000000000, win 64240, length 0"
        echo "12:34:56.791345 IP 10.0.0.5.53 > 10.0.0.10.8080: Flags [S], seq 1000001000, win 64240, length 0"
        echo "12:34:56.791456 IP 10.0.0.5.53 > 10.0.0.10.21: Flags [S], seq 1000002000, win 64240, length 0"
    elif [[ "$LAST_NMAP" == *"--source-port 80"* ]]; then
        # HTTP source port
        echo "12:34:56.791567 IP 10.0.0.5.80 > 10.0.0.10.80: Flags [S], seq 1000000000, win 64240, length 0"
        echo "12:34:56.791678 IP 10.0.0.5.80 > 10.0.0.10.8080: Flags [S], seq 1000001000, win 64240, length 0"
        echo "12:34:56.791789 IP 10.0.0.5.80 > 10.0.0.10.21: Flags [S], seq 1000002000, win 64240, length 0"
    elif [[ "$LAST_NMAP" == *"-D"* ]]; then
        # Decoy scan
        echo "12:34:56.791234 IP 192.168.1.101.65432 > 10.0.0.10.80: Flags [S], seq 1000000000, win 64240, length 0"
        echo "12:34:56.791345 IP 192.168.1.102.65433 > 10.0.0.10.80: Flags [S], seq 1000001000, win 64240, length 0"
        echo "12:34:56.791456 IP 10.0.0.5.65434 > 10.0.0.10.80: Flags [S], seq 1000002000, win 64240, length 0"
    fi
    
    # Show more packets after a few seconds to simulate traffic
    sleep 2
    echo "12:34:58.123456 IP 10.0.0.5.54330 > 10.0.0.10.22: Flags [S], seq 1000001000, win 64240, options [mss 1460,sackOK,TS val 1234567895 ecr 0,nop,wscale 7], length 0"
    echo "12:34:58.123567 IP 10.0.0.10.22 > 10.0.0.5.54330: Flags [S.], seq 2000001000, ack 1000001001, win 65160, options [mss 1460,sackOK,TS val 1234567895 ecr 1234567895,nop,wscale 7], length 0"
    
    # Show a few more packets
    sleep 1
    echo "12:34:59.123456 IP 10.0.0.5.54332 > 10.0.0.10.80: Flags [S], seq 1000003000, win 64240, options [mss 1460,sackOK,TS val 1234567900 ecr 0,nop,wscale 7], length 0"
    
    # Wait a short time then display the control-C output
    sleep 2
    echo "^C"
    echo "35 packets captured"
    echo "42 packets received by filter"
    echo "0 packets dropped by kernel"
    exit 0
else
    # If not targeting our lab IP, run the real tcpdump command
    /usr/bin/tcpdump "$@"
fi
EOF

# Make the scripts executable
chmod +x /home/kali/bin/nmap
chmod +x /home/kali/bin/tcpdump

# Create symbolic links that will override the system commands
sudo ln -sf /home/kali/bin/nmap /usr/local/bin/nmap
sudo ln -sf /home/kali/bin/tcpdump /usr/local/bin/tcpdump

# Add a hosts entry for the target
echo "10.0.0.10 target" | sudo tee -a /etc/hosts

# Reload the shell to apply changes
echo "Setup complete. Please open a new terminal or type 'exec bash' to apply changes."
