FROM debian:12.6

RUN apt-get update && apt-get install -y openssh-server \
    && useradd -m remote_user \
    && echo "remote_user:topsecret" | chpasswd \
    && mkdir -p /home/remote_user/.ssh \
    && chmod 700 /home/remote_user/.ssh
