# Use Node.js 20 LTS
FROM node:20-bullseye

# Set working directory
WORKDIR /usr/src/app

# Copy package files first
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application
COPY . .

# Build Strapi admin panel
RUN npm run build

# Expose Strapi default port
EXPOSE 1337

# Set environment variables
ENV NODE_ENV=production
ENV DATABASE_CLIENT=postgres
ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_NAME=strapi
ENV DATABASE_USERNAME=strapi
ENV DATABASE_PASSWORD=strapi

# Start Strapi
CMD ["npm", "run", "start"]
