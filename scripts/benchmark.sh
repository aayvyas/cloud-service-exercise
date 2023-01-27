echo 'Apache Benchmark Test'
echo 'Enter url:'
read URL
echo 'Enter number of requests:'
read n
echo 'Enter number of concurrent requests:'
read c

sudo apt-get -y install apache2-utils 
sudo apt-get -y install apache2 

ab -n $n -c $c $URL