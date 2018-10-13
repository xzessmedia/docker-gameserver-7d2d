FROM ubuntu:18.04
RUN dpkg --add-architecture i386; apt update; apt install -y -q  mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 telnet expect
RUN useradd -d /home/sdtdserver -ms /bin/bash -g root -G sudo sdtdserver
RUN echo 'sdtdserver:123456' | chpasswd
USER sdtdserver
WORKDIR /home/sdtdserver

RUN wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh /home/sdtdserver

RUN bash linuxgsm.sh sdtdserver install
RUN bash sdtdserver auto-install
RUN bash
