FROM --platform=amd64 ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update \
  && apt install -y --no-install-recommends \
  binutils \
  build-essential \
  golang \
  sysstat \
  python3-matplotlib \
  python3-pil \
  fonts-takao \
  fio \
  qemu-kvm \
  virt-manager \
  libvirt-clients \
  virtinst \
  jq \
  docker.io \
  containerd \
  libvirt-daemon-system \
  strace \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/*
RUN adduser `id -un` libvirt
RUN adduser `id -un` libvirt-qemu
RUN adduser `id -un` kvm
