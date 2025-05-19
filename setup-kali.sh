#!/bin/bash

# setup-kali.sh 
mkdir -p /home/kali/mock_outputs

cat > /home/kali/mock_outputs/sT.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:14 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 999 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 5.32 seconds
EOF

cat > /home/kali/mock_outputs/sS.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:14 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 999 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 4.87 seconds
EOF

cat > /home/kali/mock_outputs/sN.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:15 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00044s latency).
Not shown: 996 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
8080/tcp open|filtered http-proxy
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 5.64 seconds
EOF

cat > /home/kali/mock_outputs/sF.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:15 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 996 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
443/tcp  open|filtered https
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 5.53 seconds
EOF

cat > /home/kali/mock_outputs/sX.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:15 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00041s latency).
Not shown: 995 filtered tcp ports
PORT     STATE         SERVICE
21/tcp   open|filtered ftp
80/tcp   open|filtered http
443/tcp  open|filtered https
8000/tcp open|filtered http-alt
22/tcp   open          ssh

Nmap done: 1 IP address (1 host up) scanned in 5.58 seconds
EOF

cat > /home/kali/mock_outputs/sS_f.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:20 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 996 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https

Nmap done: 1 IP address (1 host up) scanned in 6.12 seconds
EOF

cat > /home/kali/mock_outputs/sS_ff.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:21 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 994 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
8000/tcp open  http-alt
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 7.72 seconds
EOF

cat > /home/kali/mock_outputs/source_port_53.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:23 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00038s latency).
Not shown: 995 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql

Nmap done: 1 IP address (1 host up) scanned in 6.73 seconds
EOF

cat > /home/kali/mock_outputs/source_port_80.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:24 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00040s latency).
Not shown: 994 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
5432/tcp open  postgresql
6379/tcp open  redis

Nmap done: 1 IP address (1 host up) scanned in 6.84 seconds
EOF

cat > /home/kali/mock_outputs/source_port_443.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:25 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00039s latency).
Not shown: 995 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 7.12 seconds
EOF

cat > /home/kali/mock_outputs/combined.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:26 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00036s latency).
Not shown: 992 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql
5432/tcp open  postgresql
6379/tcp open  redis
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 8.14 seconds
EOF

cat > /home/kali/mock_outputs/full_scan.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:27 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00042s latency).
Not shown: 65525 filtered tcp ports
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
80/tcp   open  http
443/tcp  open  https
3306/tcp open  mysql
5432/tcp open  postgresql
6379/tcp open  redis
7777/tcp open  cbt
8000/tcp open  http-alt
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 96.43 seconds
EOF

cat > /home/kali/mock_outputs/decoy.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:28 UTC
Nmap scan report for 10.0.0.10
Host is up (0.00041s latency).
Not shown: 998 filtered tcp ports
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 6.26 seconds
EOF

cat > /home/kali/mock_outputs/version.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:29 UTC
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

Nmap done: 1 IP address (1 host up) scanned in 11.24 seconds
EOF

cat > /home/kali/mock_outputs/os_detection.txt << 'EOF'
Starting Nmap 7.95 ( https://nmap.org ) at 2025-05-18 08:30 UTC
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
Nmap done: 1 IP address (1 host up) scanned in 12.68 seconds
EOF

cat > /home/kali/mock_outputs/tcpdump.txt << 'EOF'
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
12:34:56.789012 IP 10.0.0.5.54321 > 10.0.0.10.22: Flags [S], seq 1000000000, win 64240, options [mss 1460,sackOK,TS val 1234567890 ecr 0,nop,wscale 7], length 0
12:34:56.789123 IP 10.0.0.10.22 > 10.0.0.5.54321: Flags [S.], seq 2000000000, ack 1000000001, win 65160, options [mss 1460,sackOK,TS val 1234567890 ecr 1234567890,nop,wscale 7], length 0
12:34:56.790123 IP 10.0.0.5.54322 > 10.0.0.10.80: Flags [S], seq 1000000000, win 64240, length 0
12:34:56.790234 IP 10.0.0.5.54323 > 10.0.0.10.8080: Flags [S], seq 1000000000, win 64240, length 0
12:34:56.790345 IP 10.0.0.5.54324 > 10.0.0.10.21: Flags [S], seq 1000000000, win 64240, length 0
12:34:58.123456 IP 10.0.0.5.54330 > 10.0.0.10.22: Flags [S], seq 1000001000, win 64240, options [mss 1460,sackOK,TS val 1234567895 ecr 0,nop,wscale 7], length 0
12:34:58.123567 IP 10.0.0.10.22 > 10.0.0.5.54330: Flags [S.], seq 2000001000, ack 1000001001, win 65160, options [mss 1460,sackOK,TS val 1234567895 ecr 1234567895,nop,wscale 7], length 0
^C
35 packets captured
42 packets received by filter
0 packets dropped by kernel
EOF

cat > /home/kali/command_handler.py << 'EOF'
#!/usr/bin/env python3
import os
import sys
import time
import subprocess

# Define the mapping of command patterns to output files
COMMAND_MAPPINGS = {
    "sudo nmap -sT 10.0.0.10": "sT.txt",
    "sudo nmap -Pn -sT 10.0.0.10": "sT.txt",
    "sudo nmap -sS 10.0.0.10": "sS.txt",
    "sudo nmap -Pn -sS 10.0.0.10": "sS.txt",
    "sudo nmap -sN 10.0.0.10": "sN.txt",
    "sudo nmap -Pn -sN 10.0.0.10": "sN.txt",
    "sudo nmap -sF 10.0.0.10": "sF.txt",
    "sudo nmap -Pn -sF 10.0.0.10": "sF.txt",
    "sudo nmap -sX 10.0.0.10": "sX.txt",
    "sudo nmap -Pn -sX 10.0.0.10": "sX.txt",
    "sudo nmap -sS -f 10.0.0.10": "sS_f.txt",
    "sudo nmap -Pn -sS -f 10.0.0.10": "sS_f.txt",
    "sudo nmap -sS -ff 10.0.0.10": "sS_ff.txt",
    "sudo nmap -Pn -sS -ff 10.0.0.10": "sS_ff.txt",
    "sudo nmap -sS --source-port 53 10.0.0.10": "source_port_53.txt",
    "sudo nmap -Pn -sS --source-port 53 10.0.0.10": "source_port_53.txt",
    "sudo nmap -sS --source-port 80 10.0.0.10": "source_port_80.txt",
    "sudo nmap -Pn -sS --source-port 80 10.0.0.10": "source_port_80.txt",
    "sudo nmap -sS --source-port 443 10.0.0.10": "source_port_443.txt",
    "sudo nmap -Pn -sS --source-port 443 10.0.0.10": "source_port_443.txt",
    "sudo nmap -sS -f --source-port 443 10.0.0.10": "combined.txt",
    "sudo nmap -Pn -sS -f --source-port 443 10.0.0.10": "combined.txt",
    "sudo nmap -sS -f --source-port 53 -p- --min-rate 100 10.0.0.10": "full_scan.txt",
    "sudo nmap -Pn -sS -f --source-port 53 -p- --min-rate 100 10.0.0.10": "full_scan.txt",
    "sudo nmap -sS -D 192.168.1.101,192.168.1.102,ME 10.0.0.10": "decoy.txt",
    "sudo nmap -Pn -sS -D 192.168.1.101,192.168.1.102,ME 10.0.0.10": "decoy.txt",
    "sudo nmap -sV 10.0.0.10": "version.txt",
    "sudo nmap -Pn -sV 10.0.0.10": "version.txt",
    "sudo nmap -O 10.0.0.10": "os_detection.txt",
    "sudo nmap -Pn -O 10.0.0.10": "os_detection.txt",
    "sudo nmap -O -f --source-port 80 10.0.0.10": "os_detection.txt",
    "sudo nmap -Pn -O -f --source-port 80 10.0.0.10": "os_detection.txt",
    "sudo tcpdump -i eth0 -nn host 10.0.0.10": "tcpdump.txt",
    "sudo tcpdump -i eth0 host 10.0.0.10": "tcpdump.txt",
}

# Simplify input command (remove extra spaces)
def simplify_command(cmd):
    return " ".join(cmd.split())

# Main loop to handle commands
def main():
    while True:
        try:
            # Display prompt
            sys.stdout.write("┌──(kali㉿kali)-[~]\n└─$ ")
            sys.stdout.flush()
            
            # Get user input
            command_line = input()
            
            # Split into multiple commands if present
            commands = command_line.split('sudo')
            
            # Process each command
            for i, cmd in enumerate(commands):
                if i > 0:  # Add 'sudo' back except for the first empty element
                    cmd = 'sudo' + cmd
                
                cmd = cmd.strip()
                if not cmd:
                    continue
                
                simplified_command = simplify_command(cmd)
                
                # Special case for exit
                if cmd.lower() in ["exit", "quit", "logout"]:
                    sys.exit(0)
                    
                # Special case for exec bash - restart the script
                if cmd.lower() == "exec bash":
                    print("Reloading shell...")
                    os.execl(sys.executable, sys.executable, *sys.argv)
                    
                # Check if it's a nmap or tcpdump command
                is_nmap_or_tcpdump = False
                output_file = None
                
                for key in COMMAND_MAPPINGS:
                    # Exact match
                    if simplified_command == key:
                        output_file = COMMAND_MAPPINGS[key]
                        is_nmap_or_tcpdump = True
                        break
                        
                    # Check for supported output formats
                    if simplified_command.startswith(key + " -oN "):
                        output_file = COMMAND_MAPPINGS[key]
                        is_nmap_or_tcpdump = True
                        break
                
                # If it's a nmap or tcpdump command, display the mock output
                if is_nmap_or_tcpdump and output_file:
                    # If it's tcpdump, display a single line at a time with delay
                    if "tcpdump" in simplified_command:
                        with open(f"/home/kali/mock_outputs/{output_file}", "r") as f:
                            lines = f.readlines()
                            for line in lines:
                                print(line.strip())
                                if "^C" not in line:  # Don't wait after the last line
                                    time.sleep(0.2)
                    else:
                        # For nmap commands, show all at once
                        with open(f"/home/kali/mock_outputs/{output_file}", "r") as f:
                            content = f.read()
                            print(content)
                            
                        # If -oN option is used, save to the specified file
                        if " -oN " in simplified_command:
                            output_path = simplified_command.split(" -oN ")[1].split()[0]
                            with open(output_path, "w") as f:
                                f.write(content)
                else:
                    # Execute the real command
                    try:
                        subprocess.run(cmd, shell=True)
                    except Exception as e:
                        print(f"Error executing command: {e}")
                
        except KeyboardInterrupt:
            print("\nInterrupted. Use 'exit' to quit.")
        except EOFError:
            break
        except Exception as e:
            print(f"Error: {e}")

if __name__ == "__main__":
    main()
EOF

chmod +x /home/kali/command_handler.py

cat > /home/kali/custom_bashrc << 'EOF'
# This is a custom .bashrc file that launches our lab environment
/home/kali/command_handler.py
EOF

# Make files executable
chmod +x /home/kali/custom_bashrc
chmod +x /home/kali/command_handler.py

# Add hosts entry
echo "10.0.0.10 target" | sudo tee -a /etc/hosts

echo "Setup complete! To start the lab environment, run: bash /home/kali/custom_bashrc"
