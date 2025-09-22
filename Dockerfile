FROM node:18

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

ENV NODE_ENV=development

RUN npm run build

RUN npm prune --production

EXPOSE 1337

CMD ["npm", "run", "start"]
