FROM node:16-slim
WORKDIR /app
COPY . .
RUN npm install
ENTRYPOINT ["node","server.js"]
