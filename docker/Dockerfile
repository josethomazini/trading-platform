FROM node:22-slim

USER node
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 3000
