
FROM ubuntu:14.04
MAINTAINER Peter Schaadt <peter.schaadt@gmail.com>
LABEL project='ansible-docker-base' \
  version='v1.1.0'


# Ansible Releases
PyPI: https://pypi.python.org/pypi/ansible
GitHub: https://github.com/ansible/ansible/releases

ENV ANSIBLE_STABLE=1.9.6
ENV ANSIBLE_DEV=2.1.0.0

ENV ANSIBLE_VERSION=${ANSIBLE_STABLE}

RUN echo '[DOCKER] Installing build-essential, python-dev, python-setuptools, and libssl-dev...' && \
  DEBIAN_FRONTEND=noninteractive apt-get update && \
  apt-get install -y \
    build-essential \
    python-dev \
    python-setuptools \
    libssl-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo '[DOCKER] Displaying Python version number...' && \
  python --version

RUN echo '[DOCKER] Installing pip with easy_install...' && \
  easy_install pip

RUN echo '[DOCKER] Upgrading pip with pip...' && \
  pip install --upgrade pip

RUN echo '[DOCKER] Displaying pip version number...' && \
  pip --version

RUN echo '[DOCKER] Installing Ansible v${ANSIBLE_VERSION} with pip...' && \
  pip install ansible==${ANSIBLE_VERSION}

ONBUILD RUN \
  echo '[DOCKER] Updating TLS certificates...' && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y openssl ca-certificates

# ONBUILD RUN \
#   echo '[DOCKER] Adding entry for hostname to /etc/hosts file...' && \
#   echo '255.255.255.255 private.docker-repo.com' >> /etc/hosts

# ONBUILD WORKDIR /tmp
# ONBUILD COPY . /tmp

# ONBUILD RUN \
#   echo '[DOCKER] Diagnosis: Ansible host information...' && \
#   mkdir /build && \
#   # Display Ansible host information
#   ansible -c local -i inventories all -m setup

# Display Ansible version number
CMD ['ansible-playbook', '--version']
