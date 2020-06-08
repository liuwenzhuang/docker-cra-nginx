# build stage
FROM node as build

ENV NODE_ENV production

RUN mkdir /tmp/build

WORKDIR /tmp/build

COPY ["package.json", "yarn.lock", "./"]

RUN yarn

COPY . .

RUN yarn build

# nginx stage
FROM nginx

COPY --from=build /tmp/build/build /usr/share/nginx/html
