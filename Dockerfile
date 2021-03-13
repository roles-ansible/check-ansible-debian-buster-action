FROM debian:buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-debian-buster-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-debian-buster-action"

LABEL "com.github.actions.name"="check-ansible-debian-buster"
LABEL "com.github.actions.description"="Check ansible role or playbook with Debian buster"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    git \
    systemd \
    ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
