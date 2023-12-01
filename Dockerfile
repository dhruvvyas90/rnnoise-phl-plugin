FROM ubuntu:22.04
#FROM aria_data_tools:latest

# copy git repo to the image
# COPY . /speechviz/
ENV DEBIAN_FRONTEND noninteractive
# install dependencies
RUN apt update --fix-missing && apt upgrade -y && apt install -y wget
RUN apt update --fix-missing && apt upgrade -y
RUN apt install -y python3 git python3-pip 




