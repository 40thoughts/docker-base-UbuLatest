#### Select the latest ubuntu image to build this container
FROM ubuntu:latest

#### Configure locale to French 
# just change the values to `en_US`, `en_EN`, `de_DE` or whatever you need according to your system.
####
RUN locale-gen fr_FR.UTF-8
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr  
ENV LC_ALL fr_FR.UTF-8

#### Taking image up to date
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

#### Add some extra utils you need/like
# here I added `nano`,`wget` and `htop`.
# add some packages just by typing their names in the end of the line separated by spaces.
# avoid some by removing their names.
# 
# don't remove anything before `nano`, this is the command line used to install packages.
# for those who know a little bit about linux, you may ask about `DEBIAN_FRONTEND=noninteractive`;
# this is used to avoid these ugly red warnings during the `apt-get install` process.
####
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nano wget htop

#### Lighten the image if possible
RUN apt-get clean
