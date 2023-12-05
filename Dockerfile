FROM ubuntu:22.04
# enable non interactive front end
ENV DEBIAN_FRONTEND noninteractive
# install dependencies
RUN apt update --fix-missing && apt upgrade -y && apt install -y wget
RUN apt update --fix-missing && apt upgrade -y
RUN apt install -y python3 git python3-pip 
RUN apt install -y autoconf libtool
RUN apt install -y g++ make libsndfile1-dev libjack-jackd2-dev jackd2 portaudio19-dev
# install rnnoise from github
WORKDIR /home
RUN git clone https://github.com/xiph/rnnoise
WORKDIR /home/rnnoise/
RUN ./autogen.sh && ./configure && make -j4
# install openMHA from github
WORKDIR /home
RUN git clone https://github.com/HoerTech-gGmbH/openMHA
WORKDIR /home/openMHA/
RUN mkdir /home/openMHA/mha/plugins/rnnoise/
COPY ./rnnoise/ /home/openMHA/mha/plugins/rnnoise/
RUN cp /home/rnnoise/.libs/librnnoise.a /home/openMHA/mha/plugins/rnnoise/
RUN ./configure && make -j4 install
# set the environment path
ENV PATH="${PATH}:/home/openMHA/bin/"
ENV LD_LIBRARY_PATH="/home/openMHA/lib/"
# copy the example
RUN mkdir /home/openMHA/examples/32-rnnoise/
COPY ./32-rnnoise/ /home/openMHA/examples/32-rnnoise/
# clean up
WORKDIR /home/openMHA/






