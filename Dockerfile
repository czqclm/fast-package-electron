FROM node:18.16.0
RUN apt-get update && apt-get install -y wine64
RUN dpkg --add-architecture i386 && apt update && apt install -y wine32
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/wine"

WORKDIR /
RUN mkdir /project
RUN mkdir /package_lib
COPY ./project /project

WORKDIR /project
RUN npm install
RUN npm run package_win64 && npm run package_win32

RUN cp -r /project/node_modules /package_lib
