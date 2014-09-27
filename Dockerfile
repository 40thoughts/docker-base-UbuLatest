# Select the latest ubuntu image to build this container
########################################################
FROM ubuntu:latest
MAINTAINER crazyBUD

# Configure locales to French
#############################

# just change the values to `en_US`, `en_GB`, `de_DE` or whatever you need according to your system.
RUN locale-gen fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8

# Take image up to date
#######################
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -yq

# Add the multiverse repository
###############################

# install `add-apt-repository` tool
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq software-properties-common

# insert repository
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) universe multiverse"
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc)-updates universe multiverse"

# Add some extra utils you need/like
####################################

# here I added `nano`,`wget`, `htop` and `supervisor`.
# add some packages just by typing their names in the end of the line separated by spaces.
# avoid some by removing their names.
#
# everything typed before `nano` is a part from the command line used to install packages, so please, DON'T REMOVE/ALTER IT.
# for those who know a little bit about linux, you may ask about `DEBIAN_FRONTEND=noninteractive`;
# this is used to avoid these ugly red warnings during the `apt-get install` process.
####
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq nano wget htop supervisor

# Configure `supervisor`
########################

# add the configuration file
ADD .supervisor.conf /etc/supervisor.conf

# Configure "noboby's home"
###########################

# create user's home directory
RUN mkdir -p /home/nobody

# set the permissions
RUN chown -R nobody:users /home/nobody
RUN chmod -R 775 /home/nobody

# Lighten the image if possible
###############################
RUN apt-get clean
RUN rm -rf /tmp/*
