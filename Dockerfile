FROM centos:8.3.2011

ARG python_version=3.8.8

RUN dnf install -y \
  wget \
  make \
  gcc \
  zlib-devel \
  openssl-devel \
  libffi-devel

RUN wget https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tgz -O /tmp/python.tgz && \
    tar xvf /tmp/python.tgz -C /tmp && \
    cd /tmp/Python-${python_version} && \
    ./configure --enable-optimizations && \
    make install

RUN /usr/local/bin/python3 -m pip install --upgrade pip

RUN rm /tmp/python.tgz && \
    rm -rf /tmp/Python-${python_version}

