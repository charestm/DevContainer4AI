FROM tensorflow/tensorflow:latest-gpu-jupyter

RUN apt-get update && \
    apt-get -y install sudo

RUN apt-get upgrade -f -y --force-yes

RUN pip install --upgrade pip 

RUN mkdir /init

COPY ./packages.txt /init/packages.txt
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install $(grep -vE "^\s*#" /init/packages.txt  | tr "\n" " ")

COPY ./requirements.txt /init/requirements.txt
RUN pip3 -q install pip --upgrade
RUN pip install -r /init/requirements.txt

RUN groupadd --gid 5000 vscode \
    && useradd --home-dir /home/vscode --create-home --uid 5000 \
    --gid 5000 --shell /bin/sh --skel /dev/null vscode \
	&& usermod -aG sudo vscode \
    && echo vscode ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode

ENV SHELL /bin/bash