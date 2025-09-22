
FROM node:18-bullseye

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

ARG NODE_OPTIONS
ENV NODE_OPTIONS=$NODE_OPTIONS

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
