# Select the latest ubuntu image to build this container
FROM ubuntu:latest

# Taking image up to date
RUN apt-get update
RUN apt-get -y upgrade

# configure FR locale
RUN apt-get install -y locales
RUN echo "fr_FR.UTF-8 UTF-8" >/etc/locale.gen
RUN /usr/sbin/locale-gen
RUN update-locale LANG=fr_FR.UTF-8

# Add some extra utils that we often need
RUN apt-get install -y wget

# slim down some if possible
RUN apt-get clean
