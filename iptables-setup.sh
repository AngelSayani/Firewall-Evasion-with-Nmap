#!/bin/bash

# Clear existing rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow SSH (port 22)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Block standard TCP SYN scans to web servers (80 and 443)
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j DROP
iptables -A INPUT -p tcp --dport 443 -m state --state NEW -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j DROP

# Block standard scans to FTP server (port 21)
iptables -A INPUT -p tcp --dport 21 -m state --state NEW -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j DROP

# Allow traffic from certain source ports (for source port spoofing exercise)
iptables -A INPUT -p tcp --sport 53 -j ACCEPT    # DNS
iptables -A INPUT -p tcp --sport 80 -j ACCEPT    # HTTP
iptables -A INPUT -p tcp --sport 443 -j ACCEPT   # HTTPS

# Save rules
iptables-save > /etc/iptables/rules.v4

echo "Firewall rules configured and saved!"
