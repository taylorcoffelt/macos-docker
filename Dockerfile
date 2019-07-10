FROM alpine
RUN apk add libvirt-daemon qemu-img qemu-system-x86_64 openrc bash
RUN rc-update add libvirtd
COPY . /macostools/
WORKDIR /macostools
ENTRYPOINT ["./headless.sh"]