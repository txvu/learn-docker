FROM node:18-alpine


EXPOSE 3000

# COPY index.html index.html

RUN apk add --update tini

RUN mkdir -p /user/src/app

WORKDIR /user/src/app

COPY package.json package.json

RUN npm install && npm cache clean

COPY . .

CMD [ "tini", "--", "node"]