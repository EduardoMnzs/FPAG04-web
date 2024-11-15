FROM node:22.4

ENV TERM=xterm-256color
ENV TZ=Brazil/East
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    build-essential \
    vim \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/user/app

COPY /api /home/user/app/

COPY package.json /home/user/app/

RUN npm install

CMD [ "/bin/bash" ]