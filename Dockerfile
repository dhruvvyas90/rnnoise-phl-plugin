FROM ubuntu:22.04
#FROM aria_data_tools:latest

# copy git repo to the image
# COPY . /speechviz/
ENV DEBIAN_FRONTEND noninteractive
# install dependencies
RUN apt update --fix-missing && apt upgrade -y && apt install -y wget
RUN apt update --fix-missing && apt upgrade -y
RUN apt install -y python3 git python3-pip 
RUN apt install -y autoconf libtool
RUN apt install -y g++ make libsndfile1-dev libjack-jackd2-dev jackd2 portaudio19-dev
RUN cd /home/
RUN git clone https://github.com/xiph/rnnoise
RUN cd runnoise
RUN ./configure && make -j4
RUN cd .. && git clone https://github.com/HoerTech-gGmbH/openMHA
RUN cd openMHA
ADD ./rnnoise/ /home/openMHA/mha/plugins/
RUN cd /home/openMHA/mha/plugins/rnnoise/
RUN cp /home/rnnoise/.libs/librnnoise.a .
RUN cd /home/openMHA/
RUN ./configure && make -j4 install
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/openMHA/lib/
RUN export PATH=$PATH:/home/openMHA/bin/






