# FROM node:18-alpine
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get update && apt-get install -y curl
RUN echo "hello world" | grep "world" | wc -l
CMD ["echo", "Hello, world!"]
