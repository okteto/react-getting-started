FROM okteto/node:10 as dev
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install 

FROM dev as build
COPY . .
RUN yarn build

FROM bitnami/nginx as prod
COPY --from=build /usr/src/app/build /app