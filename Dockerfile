FROM node:18-alpine3.15
WORKDIR /app
COPY package* .
RUN npm install; yarn install
COPY . .
CMD ["yarn", "run", "start:dev"]