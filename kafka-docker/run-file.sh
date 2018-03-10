# update the my-docker-compose.yml IP address with the docker 
# address of the current host

# clone the docker directory
git clone https://github.com/wurstmeister/kafka-docker

# update the docker and compose it
cp my-docker-compose.yml kafka-docker/docker-compose.yml
cd kafka-docker/
docker-compose scale kafka=4 zookeeper=1
cd ..