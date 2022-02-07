# Prepare environment
FROM node:16

RUN npm install pm2 -g

WORKDIR /usr/src/app

# add permision to node user
# RUN chown -R node:node /usr/src/app

COPY package*.json .

RUN ls -ll

RUN yarn install --prod

COPY . .

EXPOSE 5000

CMD [ "pm2-runtime", "index.js"]
