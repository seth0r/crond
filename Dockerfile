FROM ubuntu:24.04
MAINTAINER me+docker@seth0r.net

RUN apt-get update 
RUN apt-get dist-upgrade -y
RUN apt-get -y install cron rsync openssh-client vim wget curl

VOLUME /etc/cron.d/

RUN cp /etc/crontab /etc/crontab.orig

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cat /etc/crontab.orig /etc/cron.d/*.cron > /etc/crontab && cron && tail -f /var/log/cron.log
