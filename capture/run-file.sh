DOCKER_TAG=fluentd-stable
DOCKER_NAME=fluent-capture

docker kill $DOCKER_NAME
docker rm $DOCKER_NAME
docker build -t $DOCKER_TAG .
#docker run -d -p 9880:9880 -p 20001:20001 -p 42100:42100/udp \
#   -v /home/dso/fluentd:/fluentd/etc -e FLUENTD_CONF=fluent.conf --name $DOCKER_NAME $DOCKER_TAG
docker run -d -p 9880:9880 -p 20001:20001 -p 42100:42100/udp \
              -p 42101:42101/udp \
    -e FLUENTD_CONF=fluent.conf --name $DOCKER_NAME $DOCKER_TAG
