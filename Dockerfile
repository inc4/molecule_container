FROM debian:buster

RUN apt update && \
    apt install -y sudo bash iproute2 gnupg2 apt-utils vim ca-certificates \
    systemd systemd-sysv python3 python3-pip python3-apt apt-transport-https \
    procps software-properties-common wget curl spiped nginx && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add - && \
    echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo \
    tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
    apt update && apt install -y mongodb-org nodejs && \
    apt clean 

COPY ./mongod.conf /etc/mongod.conf

COPY ./mongod.service /lib/systemd/system/mongod.service

CMD [ "mongod --bind_ip 0.0.0.0" ]

CMD [ "/sbin/init" ]

EXPOSE 80 443 27017 28017
