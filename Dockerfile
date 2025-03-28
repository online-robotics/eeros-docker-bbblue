FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETPLATFORM

# Update the base image and install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    cmake \
    make \
    file \
    git \
    ca-certificates \
    iputils-ping \
    python3 \
    wget \
    xz-utils && \
    rm -rf /var/lib/apt/lists/*

# Install EEROS SDK
RUN case ${TARGETPLATFORM} in \
        "linux/amd64") wget -O /tmp/ost-devel.sh https://gitlab.ost.ch/tech/inf/public/yocto/meta-mse-tsm-autmobros/-/package_files/12750/download --no-check-certificate;; \
        "linux/arm64") wget -O /tmp/ost-devel.sh https://gitlab.ost.ch/tech/inf/public/yocto/meta-mse-tsm-autmobros/-/package_files/12749/download --no-check-certificate;; \
    esac && \
    chmod +x /tmp/ost-devel.sh && \
    /tmp/ost-devel.sh && \
    rm /tmp/ost-devel.sh && \
    echo 'source /opt/ost-devel/1.0/environment-setup-cortexa8hf-neon-poky-linux-gnueabi' >> /root/.bashrc && \
    ln -s /opt/ost-devel/1.0/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-hard.h /opt/ost-devel/1.0/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/gnu/stubs-soft.h

CMD ["/bin/bash"]