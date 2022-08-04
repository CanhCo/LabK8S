# The Order Service Buid with NestJS

## Description

The Order API service

## Tech

- NestJS
- MongoDB
- Swagger
- WebSocket
- Unit test with Jest
- Docker

## Configuration in `.env`

```
#This is the Mongo DB server
API_KEY=1234
PORT=3001
PAYMENT_SERVICE_HOST=localhost
PAYMENT_SERVICE_PORT=4002
MONGODB_DATABASE_URI=mongodb://localhost:27017/orders-api
```

## Installation

```bash
$ npm install
```

## Running the app

```bash
#1 Start docker container first
$ docker-compose up

#2 Insntall packages
$ yarn install

#3 watch mode
$ yarn run start:dev
```

## Test

```bash
# unit tests
$ npm run test

# test coverage
$ npm run test:cov
```


# Build With K8S
