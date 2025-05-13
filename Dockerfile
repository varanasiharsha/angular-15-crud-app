FROM node:20-alpine as build

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist/my-curd-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
