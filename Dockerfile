FROM debian:buster

RUN apt update && \
    apt install -y sudo bash iproute2 gnupg2 apt-utils vim ca-certificates \
    systemd systemd-sysv python3 python3-pip python3-apt apt-transport-https \
    procps software-properties-common wget curl spiped nginx && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt update && apt install -y nodejs && \
    apt clean 

CMD [ "/sbin/init" ]

EXPOSE 80 443
