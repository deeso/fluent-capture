FROM fluent/fluentd:v1.1.1-debian


RUN apt-get update
# install the prerequisite patches here so that rvm will install under non-root account. 
RUN apt-get update && \
    apt-get install -y curl patch gawk g++ gcc make libc6-dev \
            patch libreadline6-dev zlib1g-dev libssl-dev \
            libyaml-dev libsqlite3-dev sqlite3 autoconf  \
            libgdbm-dev libncurses5-dev automake libtool \
            bison pkg-config libffi-dev ruby2.3-dev && \
    fluent-gem install fluent-plugin-mongo && \
    fluent-gem install fluent-plugin-kafka && \
    fluent-gem install fluent-plugin-elasticsearch

RUN mkdir -p /fluentd/etc/
COPY fluent.conf /fluentd/etc/fluent.conf



EXPOSE 20001/tcp 42100/udp 42101/udp
