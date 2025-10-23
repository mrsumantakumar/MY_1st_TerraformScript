#!/bin/bash
sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Welcome to Sumanta's room in Devops </h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx