FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y build-essential wget curl python3-minimal python3-pip python3-dev lsb-release software-properties-common gnupg
RUN wget https://apt.llvm.org/llvm.sh \
    && chmod +x llvm.sh \
    && ./llvm.sh 17 \
    && which clang++-17 \
    && clang++-17 --version \
    && apt-get install -y make cmake ccache ninja-build yasm gawk wget \
    && ccache -s \
    && add-apt-repository ppa:git-core/ppa -y \
    && apt-get update \
    && apt-get install -y git \
    && ln -s /usr/bin/clang-17 /usr/bin/clang \
    && ln -s /usr/bin/clang++-17 /usr/bin/clang++ \
    && which clang++ \
    && clang++ --version \
    && python3 -m pip install -U pip tox pybind11 twine setuptools wheel \
    && cd /tmp && wget https://github.com/NixOS/patchelf/releases/download/0.17.2/patchelf-0.17.2-x86_64.tar.gz -O patchelf.tar.gz \
    && tar -xvf patchelf.tar.gz \
    && cp bin/patchelf /usr/bin/ \
    && chmod +x /usr/bin/patchelf \
    && wget https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-Linux-x86_64.sh -q -O /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /opt/cmake-3.24.1 \
    && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.24.1 \
    && rm /tmp/cmake-install.sh \
    && ln -s /opt/cmake-3.24.1/bin/* /usr/local/bin

ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++
ENV CCACHE_DIR=/ccache

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["echo","exited"]
