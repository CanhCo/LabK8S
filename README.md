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


# Deploying Nestjs Application In Kubernetes

## .env
```
API_KEY=1234
PORT=3001
PAYMENT_SERVICE_HOST=localhost
PAYMENT_SERVICE_PORT=4002
MONGODB_DATABASE_URI=mongodb://mongo-service:27017/orders-api
#Thay đổi localhost băng tên service sẽ đặt khi chạy trong file service.yaml (kubectl apply -f service.yaml)
```

## Push images
```bash
# Build docker file
$ docker build -t name_images .

#Push images Dockerhub
$ docker login --login dockerhub
$ docker tag name_images:latest username_dockerhub/nestjs:latest
$ docker push username_dockerhub/nestjs:latest
```

## Create Kubernetes pod(service) .yml
```bash

$ vi pod.yml

apiVersion: v1
kind: Pod
metadata:
  name: mongo
  labels:
    name: mongo
spec:
  containers:
  - name: mongo
    image: mongo
    ports:
      - containerPort: 27017
        name: mongo-db-svc

---
apiVersion: v1
kind: Service
metadata:
  name: mongo-service
spec:
  selector:
    name: mongo
  ports:
  - name: mongo-service
    protocol: TCP
    port: 27017
    targetPort: mongo-db-svc

```

## Create Kubernetes deployment.yml
```bash

$ vi deployment.yml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nestjs-deployment
  labels:
    app: nestjs
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nestjs
  template:
    metadata:
      labels:
        app: nestjs
    spec:
      containers:
      - name: nestjs
        image: phamthaochi220599/nestjs:latest
        ports:
        - containerPort: 3001

---
apiVersion: v1
kind: Service
metadata:
  name: nestjs-service
spec:
  selector:
    app: nestjs
  ports:
  - name: nestjs-service
    protocol: TCP
    port: 3001
    targetPort: 3001
    nodePort: 30001
  type: NodePort

```

## Deploy application
```bash

$ kubectl apply -f demok8sservice.yml
$ kubectl apply -f demok8sdeployment.yml
```
