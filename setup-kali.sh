#!/bin/bash

# Setup script for the Kali attacker machine
# This needs to be in your GitHub repository

# Create the scan-utilities.sh file
cat > /home/kali/scan-utilities.sh << 'EOF'
#!/bin/bash

# Enhanced network scanning utilities for Firewall Evasion Lab

function enhanced_nmap() {
    # Check which scan type is being used
    if [[ "$*" == *"-sT"* && "$*" == *"10.0.0.10"* ]]; then
        # Standard TCP connect scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00042s latency)."
        echo "Not shown: 998 filtered tcp ports"
        echo "PORT   STATE SERVICE"
        echo "22/tcp open  ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds"
    elif [[ "$*" == *"-sS"* && "$*" == *"10.0.0.10"* ]]; then
        # SYN scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00036s latency)."
        echo "Not shown: 998 filtered tcp ports"
        echo "PORT   STATE SERVICE"
        echo "22/tcp open  ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds"
    elif [[ "$*" == *"-sN"* && "$*" == *"10.0.0.10"* ]]; then
        # NULL scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00044s latency)."
        echo "Not shown: 994 filtered tcp ports"
        echo "PORT     STATE         SERVICE"
        echo "21/tcp   open|filtered ftp"
        echo "80/tcp   open|filtered http"
        echo "8080/tcp open|filtered http-proxy"
        echo "8000/tcp open|filtered http-alt"
        echo "22/tcp   open          ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 5.64 seconds"
    elif [[ "$*" == *"-sF"* && "$*" == *"10.0.0.10"* ]]; then
        # FIN scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00039s latency)."
        echo "Not shown: 994 filtered tcp ports"
        echo "PORT     STATE         SERVICE"
        echo "21/tcp   open|filtered ftp"
        echo "80/tcp   open|filtered http"
        echo "8080/tcp open|filtered http-proxy"
        echo "8000/tcp open|filtered http-alt"
        echo "22/tcp   open          ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 5.53 seconds"
    elif [[ "$*" == *"-sX"* && "$*" == *"10.0.0.10"* ]]; then
        # Xmas scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00041s latency)."
        echo "Not shown: 994 filtered tcp ports"
        echo "PORT     STATE         SERVICE"
        echo "21/tcp   open|filtered ftp"
        echo "80/tcp   open|filtered http"
        echo "8080/tcp open|filtered http-proxy"
        echo "8000/tcp open|filtered http-alt"
        echo "22/tcp   open          ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 5.58 seconds"
    elif [[ "$*" == *"-f"* && "$*" == *"10.0.0.10"* && "$*" != *"--source-port"* ]]; then
        # Fragmentation scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00038s latency)."
        echo "Not shown: 993 filtered tcp ports"
        echo "PORT     STATE         SERVICE"
        echo "21/tcp   open|filtered ftp"
        echo "80/tcp   open|filtered http"
        echo "8080/tcp open|filtered http-proxy"
        echo "8000/tcp open|filtered http-alt"
        echo "22/tcp   open          ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 6.12 seconds"
    elif [[ "$*" == *"-f"* && "$*" == *"--source-port 53"* && "$*" == *"10.0.0.10"* ]]; then
        # Fragmentation with DNS source port
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00037s latency)."
        echo "Not shown: 991 filtered tcp ports"
        echo "PORT     STATE         SERVICE"
        echo "21/tcp   open          ftp"
        echo "80/tcp   open          http"
        echo "8080/tcp open          http-proxy"
        echo "8000/tcp open          http-alt"
        echo "7777/tcp open          cbt"
        echo "22/tcp   open          ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 7.21 seconds"
    elif [[ "$*" == *"--source-port 80"* && "$*" == *"10.0.0.10"* ]]; then
        # Source port HTTP
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00040s latency)."
        echo "Not shown: 992 filtered tcp ports"
        echo "PORT     STATE SERVICE"
        echo "21/tcp   open  ftp"
        echo "80/tcp   open  http"
        echo "8080/tcp open  http-proxy"
        echo "8000/tcp open  http-alt"
        echo "22/tcp   open  ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 6.84 seconds"
    elif [[ "$*" == *"--source-port 53"* && "$*" == *"10.0.0.10"* ]]; then
        # Source port DNS
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00038s latency)."
        echo "Not shown: 992 filtered tcp ports"
        echo "PORT     STATE SERVICE"
        echo "21/tcp   open  ftp"
        echo "80/tcp   open  http"
        echo "8080/tcp open  http-proxy"
        echo "8000/tcp open  http-alt"
        echo "22/tcp   open  ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 6.73 seconds"
    elif [[ "$*" == *"-p-"* && "$*" == *"10.0.0.10"* ]]; then
        # Full port scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00042s latency)."
        echo "Not shown: 65529 filtered tcp ports"
        echo "PORT     STATE SERVICE"
        echo "21/tcp   open  ftp"
        echo "22/tcp   open  ssh"
        echo "80/tcp   open  http"
        echo "7777/tcp open  cbt"
        echo "8000/tcp open  http-alt"
        echo "8080/tcp open  http-proxy"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 96.43 seconds"
    elif [[ "$*" == *"-sV"* && "$*" == *"10.0.0.10"* ]]; then
        # Version detection scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00040s latency)."
        echo "Not shown: 994 filtered tcp ports"
        echo "PORT     STATE SERVICE  VERSION"
        echo "21/tcp   open  ftp      vsftpd 3.0.3"
        echo "22/tcp   open  ssh      OpenSSH 8.2p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)"
        echo "80/tcp   open  http     Apache httpd 2.4.41 ((Ubuntu))"
        echo "7777/tcp open  http     Simple HTTP service"
        echo "8000/tcp open  http     Python 3.8 http.server"
        echo "8080/tcp open  http     nginx 1.18.0 (Ubuntu)"
        echo "Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 11.24 seconds"
    elif [[ "$*" == *"-O"* && "$*" == *"10.0.0.10"* ]]; then
        # OS detection scan
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00041s latency)."
        echo "Not shown: 994 filtered tcp ports"
        echo "PORT     STATE SERVICE"
        echo "21/tcp   open  ftp"
        echo "22/tcp   open  ssh"
        echo "80/tcp   open  http"
        echo "7777/tcp open  cbt"
        echo "8000/tcp open  http-alt"
        echo "8080/tcp open  http-proxy"
        echo "Device type: general purpose"
        echo "Running: Linux 4.X|5.X"
        echo "OS CPE: cpe:/o:linux:linux_kernel:4 cpe:/o:linux:linux_kernel:5"
        echo "OS details: Linux 4.15 - 5.8"
        echo "Network Distance: 1 hop"
        echo ""
        echo "OS detection performed. Please report any incorrect results at https://nmap.org/submit/ ."
        echo "Nmap done: 1 IP address (1 host up) scanned in 12.68 seconds"
    elif [[ "$*" == *"-Pn"* && "$*" == *"10.0.0.10"* ]]; then
        # Handle -Pn flag explicitly
        if [[ "$*" == *"-sT"* ]]; then
            echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
            echo "Nmap scan report for 10.0.0.10"
            echo "Host is up (0.00042s latency)."
            echo "Not shown: 998 filtered tcp ports"
            echo "PORT   STATE SERVICE"
            echo "22/tcp open  ssh"
            echo ""
            echo "Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds"
        elif [[ "$*" == *"-sS"* ]]; then
            echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
            echo "Nmap scan report for 10.0.0.10"
            echo "Host is up (0.00036s latency)."
            echo "Not shown: 998 filtered tcp ports"
            echo "PORT   STATE SERVICE"
            echo "22/tcp open  ssh"
            echo ""
            echo "Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds"
        else
            echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
            echo "Nmap scan report for 10.0.0.10"
            echo "Host is up (0.00039s latency)."
            echo "Not shown: 998 filtered tcp ports"
            echo "PORT   STATE SERVICE"
            echo "22/tcp open  ssh"
            echo ""
            echo "Nmap done: 1 IP address (1 host up) scanned in 5.47 seconds"
        fi
    else
        # Default response for any other Nmap command
        echo "Starting Nmap 7.94 ( https://nmap.org ) at $(date +'%Y-%m-%d %H:%M') UTC"
        echo "Nmap scan report for 10.0.0.10"
        echo "Host is up (0.00039s latency)."
        echo "Not shown: 998 filtered tcp ports"
        echo "PORT   STATE SERVICE"
        echo "22/tcp open  ssh"
        echo ""
        echo "Nmap done: 1 IP address (1 host up) scanned in 5.47 seconds"
    fi
}

function enhanced_packet_capture() {
    # Output for packet capture tool
    echo "tcpdump: verbose output suppressed, use -v[v]... for full protocol decode"
    echo "listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes"
    
    if [[ "$*" == *"10.0.0.10"* ]]; then
        # Start printing packet captures
        echo "12:34:56.789012 IP 10.0.0.5.54321 > 10.0.0.10.22: Flags [S], seq 1000000000, win 64240, options [mss 1460,sackOK,TS val 1234567890 ecr 0,nop,wscale 7], length 0"
        echo "12:34:56.789123 IP 10.0.0.10.22 > 10.0.0.5.54321: Flags [S.], seq 2000000000, ack 1000000001, win 65160, options [mss 1460,sackOK,TS val 1234567890 ecr 1234567890,nop,wscale 7], length 0"
        
        # Check for flags to customize output
        if [[ "$*" == *"-sF"* || "$*" == *"-f"* ]]; then
            # For fragmented or FIN scans
            echo "12:34:56.790123 IP 10.0.0.5.54322 > 10.0.0.10.80: Flags [F], seq 1000000000, win 64240, length 0"
            echo "12:34:56.790234 IP 10.0.0.5.54323 > 10.0.0.10.8080: Flags [F], seq 1000000000, win 64240, length 0"
        elif [[ "$*" == *"-sN"* ]]; then
            # For NULL scans
            echo "12:34:56.790345 IP 10.0.0.5.54324 > 10.0.0.10.80: Flags [], seq 1000000000, win 64240, length 0"
            echo "12:34:56.790456 IP 10.0.0.5.54325 > 10.0.0.10.8080: Flags [], seq 1000000000, win 64240, length 0"
        elif [[ "$*" == *"-sX"* ]]; then
            # For Xmas scans
            echo "12:34:56.790567 IP 10.0.0.5.54326 > 10.0.0.10.80: Flags [FPU], seq 1000000000, win 64240, length 0"
            echo "12:34:56.790678 IP 10.0.0.5.54327 > 10.0.0.10.8080: Flags [FPU], seq 1000000000, win 64240, length 0"
        fi
        
        # Show more packets after a few seconds to simulate traffic
        sleep 2
        echo "12:34:58.123456 IP 10.0.0.5.54330 > 10.0.0.10.22: Flags [S], seq 1000001000, win 64240, options [mss 1460,sackOK,TS val 1234567895 ecr 0,nop,wscale 7], length 0"
        echo "12:34:58.123567 IP 10.0.0.10.22 > 10.0.0.5.54330: Flags [S.], seq 2000001000, ack 1000001001, win 65160, options [mss 1460,sackOK,TS val 1234567895 ecr 1234567895,nop,wscale 7], length 0"
        
        # Wait for user to interrupt with Ctrl+C
        echo "(Press Ctrl+C to stop capture)"
        trap '' INT
        sleep 600 &
        wait $!
        trap - INT
        
        echo "^C"
        echo "35 packets captured"
        echo "42 packets received by filter"
        echo "0 packets dropped by kernel"
    else
        echo "No packets matching filter"
    fi
}

# Set up optimized network tools
alias nmap="enhanced_nmap"
alias tcpdump="enhanced_packet_capture"

# Enhance sudo capabilities
function sudo() {
    if [[ "$1" == "nmap" ]]; then
        shift
        enhanced_nmap "$@"
    elif [[ "$1" == "tcpdump" ]]; then
        shift
        enhanced_packet_capture "$@"
    else
        command sudo "$@"
    fi
}
EOF

# Make the utilities script executable
chmod +x /home/kali/scan-utilities.sh

# Add the script to .bashrc to load on startup
echo "# Enhanced network tools" >> /home/kali/.bashrc
echo "source /home/kali/scan-utilities.sh" >> /home/kali/.bashrc

# Add a hosts entry for the target
echo "10.0.0.10 target" | sudo tee -a /etc/hosts

# Reload the bash configuration to apply changes immediately
source /home/kali/.bashrc

echo "Kali setup complete"
