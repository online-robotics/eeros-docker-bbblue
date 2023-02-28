FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y git python cmake

ADD https://gitlab.ost.ch/tech/inf/public/yocto/meta-mse-tsm-autmobros/-/package_files/5855/download /tmp/ost-devel-glibc-x86_64-autmobros-image-dunfell-dev-cortexa8hf-neon-bblue-toolchain-1.0.sh
RUN chmod +x /tmp/ost-devel-glibc-x86_64-autmobros-image-dunfell-dev-cortexa8hf-neon-bblue-toolchain-1.0.sh \
    && /tmp/ost-devel-glibc-x86_64-autmobros-image-dunfell-dev-cortexa8hf-neon-bblue-toolchain-1.0.sh \
    && rm /tmp/ost-devel-glibc-x86_64-autmobros-image-dunfell-dev-cortexa8hf-neon-bblue-toolchain-1.0.sh
RUN echo 'source /opt/ost-devel/1.0/environment-setup-cortexa8hf-neon-poky-linux-gnueabi' >> /root/.bashrc \
    && ln -s /opt/ost-devel/1.0/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-hard.h /opt/ost-devel/1.0/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-soft.h

CMD [ "/bin/bash" ]
