# Prepare environment
FROM node:alpine AS BUILD_IMAGE

RUN npm install pm2 -g

WORKDIR /usr/src/app

# add permision to node user
RUN chown -R node:node /usr/src/app

COPY package*.json ./usr/src/app

RUN yarn install --prod

USER node

EXPOSE 5000

CMD [ "pm2-runtime", "index.js"]
