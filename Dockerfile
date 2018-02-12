FROM ubuntu:16.04
RUN apt-get update && apt-get install -y openssh-server python-apt
RUN apt-get install sudo
RUN groupadd user
RUN useradd user -p azerty -g user
RUN mkdir -p /home/user/.ssh
WORKDIR /home/user
ADD ansible.pub /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user
RUN mkdir /var/run/sshd
RUN mkdir -p /etc/sudoers.d
RUN echo "user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
CMD ["/usr/sbin/sshd","-D"]


