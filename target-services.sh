#!/bin/bash

# Make sure required services are installed
apt-get update
apt-get install -y apache2 nginx vsftpd openssh-server

# Configure Apache (port 80)
systemctl enable apache2
systemctl start apache2
echo "<html><body><h1>Apache Web Server</h1><p>This is running on port 80</p></body></html>" > /var/www/html/index.html

# Configure Nginx (port 8080)
sed -i 's/listen 80 default_server;/listen 8080 default_server;/' /etc/nginx/sites-available/default
systemctl enable nginx
systemctl start nginx
echo "<html><body><h1>Nginx Web Server</h1><p>This is running on port 8080</p></body></html>" > /var/www/html/nginx-index.html
cp /var/www/html/nginx-index.html /usr/share/nginx/html/index.html

# Configure FTP Server (port 21)
systemctl enable vsftpd
systemctl start vsftpd

# Configure SSH (port 22)
systemctl enable ssh
systemctl start ssh

# Start additional services on non-standard ports
# Custom HTTP service on port 8000
nohup python3 -m http.server 8000 --directory /var/www/html/ &

# Setup a hidden service on port 7777
echo '#!/bin/bash\nwhile true; do echo -e "HTTP/1.1 200 OK\n\nSecret Service" | nc -l -p 7777; done' > /usr/local/bin/hidden-service.sh
chmod +x /usr/local/bin/hidden-service.sh
nohup /usr/local/bin/hidden-service.sh &

echo "Target services started!"
