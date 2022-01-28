# syntax=docker/dockerfile:1

FROM node:16-buster-slim

# Python3 & pip3 
RUN apt-get update && \
    apt-get install -yqq python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Update npm
RUN npm i -g npm

# Timezone
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Switch to node user
USER node

# Install requirements for RF and browserlibtaty
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN ~/.local/bin/rfbrowser init

# Path
ENV NODE_PATH=/usr/lib/node_modules
ENV PATH="/home/node/.local/bin:${PATH}"

COPY entrypoint.sh .
ENTRYPOINT [ "/robot/entrypoint.sh" ]
