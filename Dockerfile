
FROM node:18-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache python3 g++ make

COPY package*.json ./

RUN npm ci

COPY . .

ENV NODE_ENV=development

RUN npm run build

RUN npm prune --production

EXPOSE 1337

CMD ["npm", "run", "start"]
