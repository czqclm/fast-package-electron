FROM node:18.16.0
RUN apt-get update && apt-get install -y wine64
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/wine"

WORKDIR /
RUN mkdir /project
RUN mkdir /package_lib
COPY ./project /project

WORKDIR /project
RUN npm install
RUN npm run package_win

RUN cp -r /project/node_modules /package_lib
