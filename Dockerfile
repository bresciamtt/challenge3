FROM node:12-alpine

# Create app directory
RUN mkdir -p /usr/src/app/challenge3
WORKDIR /usr/src/app/challenge3

# Installing dependencies
COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

EXPOSE 3000
