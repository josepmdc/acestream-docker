FROM ubuntu:focal

EXPOSE 6878/tcp

WORKDIR home

RUN apt-get update && apt-get -y install curl
RUN curl -s https://download.acestream.media/linux/acestream_3.1.75rc4_ubuntu_18.04_x86_64_py3.8.tar.gz \
    | tar xvz

# remove sudo from script
RUN sed -i 's/sudo //g' install_dependencies.sh
RUN ./install_dependencies.sh

ENTRYPOINT ./start-engine --client-console
