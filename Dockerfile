FROM quay.io/cata0nana/oc_v1_img_stage_1

#FROM ubuntu:20.04
MAINTAINER 0x##Y8H4 Diklic "lol v2"

###########################################################################

ENV DISPLAY=:0 \
    NGROK_TOKENS=257VWvy4O16qLnlACoOGlAu69zH_4aaxZwYFpd7YxxeN6RY4W\
    google_main=bigoctbig\
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    NO_VNC_PORT_A=6080 \
    SSH_PORT=22 \
    US_PS=azer \
    SUPER_VISOR__PORT=9001 \
    XAUTHORITY=/home/pythony/.Xauthority \
    DEBIAN_FRONTEND=noninteractive


RUN echo $V1_NGROK_TOKENS $key002 $Environment_KEY_VAULT $key1
###########################################################################
RUN echo ${V1_NGROK_TOKENS}
RUN echo $V1_NGROK_TOKENS
RUN echo $NGROK_TOKENS
ENV HOME=/home/pythony \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    VNC_VIEW_ONLY=false
    
###########################################################################
ADD ./etc/ /etc/
###########################################################################

COPY ./payload/* "${STARTUPDIR}"/
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +


RUN apt-get update < /dev/null > /dev/null
###########################################################################

###########################################################################

###########################################################################

# RUN $STARTUPDIR/ng.sh

###########################################################################
#ADD ./etc/ /etc/

RUN ssh-keygen -q -t rsa -N '' -f /id_rsa

RUN echo "root:1" | /usr/sbin/chpasswd
RUN addgroup uno
RUN useradd -m -s /bin/bash -g uno uno
RUN echo "uno:1" | /usr/sbin/chpasswd
RUN echo "uno    ALL=(ALL) ALL" >> /etc/sudoers





# PLEASE CHANGE THAT AFTER FIRST LOGIN
RUN echo 'mogenius:mogenius' | chpasswd
RUN echo "PLEASE CHANGE THAT AFTER FIRST LOGIN"
# PLEASE CHANGE THAT AFTER FIRST LOGIN 1007090000
#ARG UID=1007090001
ARG UID=1007090000
ARG GID=1000
#RUN groupadd -g 1000 pythony

RUN useradd --create-home --no-log-init -u "${UID}" -g "${GID}" pythony

RUN $STARTUPDIR/step_2.sh
RUN $STARTUPDIR/unroot.sh
COPY xorg.conf /etc/X11/xorg.conf
#groupadd -g "${GID}" python \
#  && 
RUN update-rc.d tor enable
RUN mkdir -p /opt/local/
RUN mkdir -p /var/run/supervisord
RUN chown pythony /var/run/supervisord
RUN touch /var/run/supervisord.pid
RUN chown pythony /var/run/supervisord.pid
RUN chmod g+wx /var/log/ && \
    chmod g+wx /opt/local/
#USER pythony
EXPOSE 22 9001 9002
#CMD ["/usr/bin/Xorg", "-noreset", "+extension", "GLX", "+extension", "RANDR", "+extension", "RENDER", "-logfile", "./xdummy.log", "-config", "/etc/X11/xorg.conf", ":1"]
RUN mkdir /home/pythony/supervisor
#CMD ["/usr/sbin/sshd", "-D", "-e"]
#CMD [ "/usr/bin/supervisord", "-n" , "-c","/etc/supervisor/supervisord.conf" ]
COPY ./payload/ah.sh /usr/bin/
RUN chmod +x /usr/bin/ah.sh
ENTRYPOINT ["ah.sh"]
#ENTRYPOINT ["/bin/sleep", "3650d"]
