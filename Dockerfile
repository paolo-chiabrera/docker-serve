FROM node:8-alpine

LABEL maintainer="Paolo Chiabrera <paolo.chiabrera@gmail.com>"

ENV NODE_ENV production

ENV PORT 80

RUN mkdir -p /tmp

RUN mkdir -p /opt/public

RUN yarn global add serve && yarn cache clean

ONBUILD COPY . /tmp

ONBUILD WORKDIR /tmp

ONBUILD RUN yarn install && yarn cache clean

ONBUILD RUN yarn build

ONBUILD RUN cp -R /tmp/build/. /opt/public/

ONBUILD RUN rm -rf /tmp

ONBUILD CMD serve -s /opt/public
