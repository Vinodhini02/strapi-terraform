FROM node:18

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y python3 g++ make && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
