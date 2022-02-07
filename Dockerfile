# Prepare environment
FROM node:alpine

RUN npm install pm2 -g

WORKDIR /usr/src/app

# add permision to node user
RUN chown -R node:node /usr/src/app

COPY . ./usr/src/app

RUN ls -ll

RUN yarn install --prod

USER node

EXPOSE 5000

CMD [ "pm2-runtime", "index.js"]
