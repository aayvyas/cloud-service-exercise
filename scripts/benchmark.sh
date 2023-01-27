# !/bin/bash

echo 'Apache Benchmark Test'
read 'IP/Url: ' URL
read 'Number of requests:' n
read 'Number of concurrent requests': c
sudo apt-get -y install apache2-utils 
sudo apt-get -y install apache2 

ab -$(n) 1000 -$(c) 10 $(URL)