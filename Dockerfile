FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETPLATFORM
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y git python cmake iputils-ping wget

RUN case ${TARGETPLATFORM} in \
        "linux/amd64") wget -O /tmp/ost-devel.sh https://gitlab.ost.ch/tech/inf/public/yocto/meta-mse-tsm-autmobros/-/package_files/12750/download ;; \
        "linux/arm64") wget -O /tmp/ost-devel.sh https://gitlab.ost.ch/tech/inf/public/yocto/meta-mse-tsm-autmobros/-/package_files/12749/download ;; \
    esac \
    && chmod +x /tmp/ost-devel.sh \
    && /tmp/ost-devel.sh \
    && rm /tmp/ost-devel.sh
RUN echo 'source /opt/ost-devel/1.0/environment-setup-cortexa8hf-neon-poky-linux-gnueabi' >> /root/.bashrc \
    && ln -s /opt/ost-devel/1.0/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-hard.h /opt/ost-devel/1.0/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-soft.h

CMD [ "/bin/bash" ]
