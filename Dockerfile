# Use Node 18 LTS (Bullseye)
FROM node:18-bullseye

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the app
COPY . .

# Build the Strapi admin panel
RUN npm run build

# Expose Strapi default port
EXPOSE 1337

# Start Strapi
CMD ["npm", "start"]
