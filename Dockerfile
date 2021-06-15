FROM ubuntu:20.04
RUN apt-get update

#Install tzdata:
RUN DEBIAN_FRONTEND="noninteractive"; TZ="America/Chicago" apt-get -y install tzdata

#Install build tools.
RUN apt-get install -y build-essential libtool libtool-bin automake autoconf gettext autopoint pkgconf #libncusrse6 libncurses-dev

#Install Rust:
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

#Install
RUN apt-get install -y vim
