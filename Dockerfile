# build project
FROM node:19 AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# create nginx server
FROM nginx:1.23-alpine AS prod-stage
COPY --from=build /app/dist /usr/share/nginx/html
