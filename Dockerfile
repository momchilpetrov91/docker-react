FROM node:16-alpine as builder
WORKDIR '/home/mopetrov/frontend'
COPY package.json .
RUN mkdir -p node_modules/.cache
RUN chmod -R 777 node_modules/.cache
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /home/mopetrov/frontend/build /usr/share/nginx/html
