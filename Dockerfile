FROM node:latest 

COPY . .

RUN yarn install 

ENTRYPOINT [ "yarn", "start" ]
