FROM node:20-alpine as build

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm run build

FROM nginx:alpine
EXPOSE 8080
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/my-curd-app /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
