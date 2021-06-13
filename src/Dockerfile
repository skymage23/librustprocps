FROM ubuntu:20.04
RUN apt-get update

#Install build tools.
RUN apt-get install -y build-essential libncurses6 libtool automake autoconf gettext

#Install Rust:
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Install
RUN apt-get install -y vim
