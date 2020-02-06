FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as run
COPY --from=builder /app/build /usr/share/nginx/html
