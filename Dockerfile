FROM nginx:alpine

LABEL maintainer="Paolo Chiabrera <paolo.chiabrera@gmail.com>"

RUN apk add --update nodejs npm yarn

RUN node -v

RUN npm -v

RUN yarn -v

ENV NODE_ENV production

ENV PORT 80

ONBUILD RUN mkdir -p /tmp

ONBUILD COPY . /tmp

ONBUILD WORKDIR /tmp

ONBUILD RUN yarn install && yarn cache clean

ONBUILD RUN yarn build

ONBUILD RUN cp -R /tmp/build/. /usr/share/nginx/html/

ONBUILD RUN rm -rf /tmp
