# Select the latest ubuntu image to build this container
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Taking image up to date
RUN apt-get update
RUN apt-get -y upgrade

# configure FR locale
RUN locale-gen fr_FR.UTF-8
RUN update-locale LANG=fr_FR.UTF-8

# Add some extra utils that we often need
RUN apt-get install -y wget

# slim down some if possible
RUN apt-get clean
