#!/bin/bash

# Setup script for the Kali attacker machine
# This needs to be in your GitHub repository

# Create wrapper scripts that will intercept nmap and tcpdump commands
# Create a directory for our wrapper scripts
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
    RESULT=""
    
    if [[ "$*" == *"-sT"* ]]; then
        # Standard TCP connect scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds"
    elif [[ "$*" == *"-sS"* ]]; then
        # SYN scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds"
    elif [[ "$*" == *"-sN"* ]]; then
        # NULL scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
    elif [[ "$*" == *"-sF"* ]]; then
        # FIN scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
    elif [[ "$*" == *"-sX"* ]]; then
        # Xmas scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
    elif [[ "$*" == *"-f"* && "$*" != *"--source-port"* ]]; then
        # Fragmentation scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 993 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
8080/tcp open|filtered http-proxy
8000/tcp open|filtered http-alt
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 6.12 seconds"
    elif [[ "$*" == *"-f"* && "$*" == *"--source-port 53"* ]]; then
        # Fragmentation with DNS source port
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00037s latency).
Not shown: 991 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
80/tcp   open  http
8080/tcp open  http-proxy
8000/tcp open  http-alt
7777/tcp open  cbt
22/tcp   open  ssh

Nmap done: 1 IP address (1 host up) scanned in 7.21 seconds"
    elif [[ "$*" == *"--source-port 80"* ]]; then
        # Source port HTTP
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00040s latency).
Not shown: 992 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
80/tcp   open  http
8080/tcp open  http-proxy
8000/tcp open  http-alt
22/tcp   open  ssh

Nmap done: 1 IP address (1 host up) scanned in 6.84 seconds"
    elif [[ "$*" == *"--source-port 53"* ]]; then
        # Source port DNS
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 992 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
80/tcp   open  http
8080/tcp open  http-proxy
8000/tcp open  http-alt
22/tcp   open  ssh

Nmap done: 1 IP address (1 host up) scanned in 6.73 seconds"
    elif [[ "$*" == *"-p-"* ]]; then
        # Full port scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
    elif [[ "$*" == *"-sV"* ]]; then
        # Version detection scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
    elif [[ "$*" == *"-O"* ]]; then
        # OS detection scan
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
    elif [[ "$*" == *"-Pn"* ]]; then
        # Handle -Pn flag with different scan types
        if [[ "$*" == *"-sT"* ]]; then
            RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds"
        elif [[ "$*" == *"-sS"* ]]; then
            RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds"
        elif [[ "$*" == *"-sN"* ]]; then
            RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
        elif [[ "$*" == *"-sF"* ]]; then
            RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
        elif [[ "$*" == *"-sX"* ]]; then
            RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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
        else
            RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.47 seconds"
        fi
    else
        # Default response for any other Nmap command
        RESULT="Starting Nmap 7.95 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC
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

# Function to handle Ctrl+C
trap_ctrlc() {
    echo "^C"
    echo "35 packets captured"
    echo "42 packets received by filter"
    echo "0 packets dropped by kernel"
    exit 0
}

# Set up the trap
trap trap_ctrlc INT

# This checks if the command is targeting our specific IP
if [[ "$*" == *"10.0.0.10"* ]]; then
    # Output for packet capture tool
    echo "tcpdump: verbose output suppressed, use -v[v]... for full protocol decode"
    echo "listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes"
    
    # Determine packet types based on last run nmap command from history
    LAST_NMAP=$(history | grep nmap | tail -n 1)
    
    # Start printing packet captures
    echo "12:34:56.789012 IP 10.0.0.5.54321 > 10.0.0.10.22: Flags [S], seq 1000000000, win 64240, options [mss 1460,sackOK,TS val 1234567890 ecr 0,nop,wscale 7], length 0"
    echo "12:34:56.789123 IP 10.0.0.10.22 > 10.0.0.5.54321: Flags [S.], seq 2000000000, ack 1000000001, win 65160, options [mss 1460,sackOK,TS val 1234567890 ecr 1234567890,nop,wscale 7], length 0"
    
    # Check for specific scan types in history
    if [[ "$LAST_NMAP" == *"-sF"* || "$LAST_NMAP" == *"-f"* ]]; then
        # For fragmented or FIN scans
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
    elif [[ "$LAST_NMAP" == *"--source-port"* ]]; then
        # For source port spoofing
        if [[ "$LAST_NMAP" == *"--source-port 53"* ]]; then
            # DNS source port
            echo "12:34:56.791234 IP 10.0.0.5.53 > 10.0.0.10.80: Flags [S], seq 1000000000, win 64240, length 0"
            echo "12:34:56.791345 IP 10.0.0.5.53 > 10.0.0.10.8080: Flags [S], seq 1000001000, win 64240, length 0"
            echo "12:34:56.791456 IP 10.0.0.5.53 > 10.0.0.10.21: Flags [S], seq 1000002000, win 64240, length 0"
        elif [[ "$LAST_NMAP" == *"--source-port 80"* ]]; then
            # HTTP source port
            echo "12:34:56.791567 IP 10.0.0.5.80 > 10.0.0.10.80: Flags [S], seq 1000000000, win 64240, length 0"
            echo "12:34:56.791678 IP 10.0.0.5.80 > 10.0.0.10.8080: Flags [S], seq 1000001000, win 64240, length 0"
            echo "12:34:56.791789 IP 10.0.0.5.80 > 10.0.0.10.21: Flags [S], seq 1000002000, win 64240, length 0"
        fi
    fi
    
    # Show more packets after a few seconds to simulate traffic
    sleep 2
    echo "12:34:58.123456 IP 10.0.0.5.54330 > 10.0.0.10.22: Flags [S], seq 1000001000, win 64240, options [mss 1460,sackOK,TS val 1234567895 ecr 0,nop,wscale 7], length 0"
    echo "12:34:58.123567 IP 10.0.0.10.22 > 10.0.0.5.54330: Flags [S.], seq 2000001000, ack 1000001001, win 65160, options [mss 1460,sackOK,TS val 1234567895 ecr 1234567895,nop,wscale 7], length 0"
    
    # Wait for user to interrupt with Ctrl+C or auto-exit after 5 seconds
    echo "(Press Ctrl+C to stop capture)"
    sleep 5
    
    # Auto-exit after 5 seconds
    echo "^C"
    echo "35 packets captured"
    echo "42 packets received by filter"
    echo "0 packets dropped by kernel"
else
    # If not targeting our lab IP, run the real tcpdump command
    /usr/bin/tcpdump "$@"
fi
EOF

# Make the scripts executable
chmod +x /home/kali/bin/nmap
chmod +x /home/kali/bin/tcpdump

# Create symbolic links that will override the system commands
# First, check if the commands exist in /usr/local/bin
if [ ! -f /usr/local/bin/nmap ]; then
    sudo ln -sf /home/kali/bin/nmap /usr/local/bin/nmap
fi

if [ ! -f /usr/local/bin/tcpdump ]; then
    sudo ln -sf /home/kali/bin/tcpdump /usr/local/bin/tcpdump
fi

# Add a hosts entry for the target
echo "10.0.0.10 target" | sudo tee -a /etc/hosts

# Reload the shell to apply changes
echo "Setup complete. Please open a new terminal or type 'exec bash' to apply changes."
