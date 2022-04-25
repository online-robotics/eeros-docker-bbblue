FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y git python cmake

ADD https://gitlab.ost.ch/tech/inf/public/meta-ost/-/package_files/3012/download /tmp/ost-distro-glibc-x86_64-ost-image-cortexa8hf-neon-bblue-toolchain-1.0.sh
RUN chmod +x /tmp/ost-distro-glibc-x86_64-ost-image-cortexa8hf-neon-bblue-toolchain-1.0.sh
RUN /tmp/ost-distro-glibc-x86_64-ost-image-cortexa8hf-neon-bblue-toolchain-1.0.sh
RUN rm /tmp/ost-distro-glibc-x86_64-ost-image-cortexa8hf-neon-bblue-toolchain-1.0.sh
RUN echo 'source /opt/ost-devel/1.0/environment-setup-cortexa8hf-neon-poky-linux-gnueabi' >> /root/.bashrc

CMD [ "/bin/bash" ]
