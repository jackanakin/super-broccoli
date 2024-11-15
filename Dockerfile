FROM node:20.12.0-alpine3.19

RUN apk add --no-cache bash

WORKDIR /opt/app

COPY src/ src/
COPY package.json tsconfig.json tsconfig.build.json .
COPY .docker/entrypoint.sh .

RUN chmod +x /opt/app/entrypoint.sh
RUN chown -R node:node /opt/app

USER node

RUN npm install
RUN npm run build

RUN rm -rf src/

ENTRYPOINT ["/opt/app/entrypoint.sh"]