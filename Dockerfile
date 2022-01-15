FROM node:lts-fermium as worker 

WORKDIR /nest-server

COPY package*.json ./

RUN yarn install --only=worker

COPY . .

RUN yarn run build

FROM node:lts-fermium as build

ARG NODE_ENV=build
ENV NODE_ENV=${NODE_ENV}

WORKDIR /nest-server

COPY --from=worker /nest-server/dist ./dist

CMD ["node", "dist/main"]
