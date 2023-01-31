FROM node

WORKDIR /morpheus
COPY package.json .
COPY yarn.lock .
RUN yarn 
COPY . .
RUN yarn build
ENTRYPOINT ["docker/entrypoint.sh"]
