#CREATE THE NODE BUILD USING NODE IMAGE

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

#create nginx web server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

