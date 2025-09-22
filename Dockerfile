FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Install build dependencies for native modules
RUN apk add --no-cache python3 g++ make bash

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (dev included for admin build)
RUN npm ci

# Copy the rest of the project
COPY . .

# Set environment variable for build
ENV NODE_ENV=development

# Build Strapi admin
RUN npm run build

# Remove dev dependencies for production
RUN npm prune --production

# Expose Strapi default port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]
