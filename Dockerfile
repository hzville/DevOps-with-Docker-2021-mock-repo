FROM ubuntu:18.04

EXPOSE 3000

WORKDIR /usr/src/app

RUN apt update -y
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install -y nodejs
RUN apt install -y git
RUN git clone https://github.com/hzville/DevOps-with-Docker-2021-mock-repo.git
RUN mkdir web-app
RUN cp -r DevOps-with-Docker-2021-mock-repo/web-app/index.html web-app/
RUN rm -rf DevOps-with-Docker-2021-mock-repo
RUN npm install -g serve

WORKDIR ./web-app

CMD serve