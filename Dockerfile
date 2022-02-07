# Prepare environment
FROM node:alpine AS BUILD_IMAGE

WORKDIR /usr/src/app

# copy all files
COPY ./server .

# install dependencies
RUN yarn

# build application
RUN yarn run build

# final result
FROM node:alpine

RUN npm install pm2 -g

WORKDIR /usr/src/app

# add permision to node user
RUN chown -R node:node /usr/src/app

RUN yarn install --prod

USER node

EXPOSE 5000

CMD [ "pm2-runtime", "dist/main.js"]
