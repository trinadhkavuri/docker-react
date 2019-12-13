FROM node:alpine   as builder

WORKDIR '/app/usr/reactjs'


COPY package.json .

RUN npm install 


COPY . .

RUN npm run build

FROM nginx
EXPOSE 80

COPY --from=builder /app/usr/reactjs/build /usr/share/nginx/html
