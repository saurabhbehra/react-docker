#specify base image
FROM node:19-alpine as builder

#if this path doesnot exist it will be created in the container
WORKDIR /usr/app

#install dependencies
COPY ./package.json ./
RUN npm install

#copy rest files
COPY ./ ./
RUN npm run build --production

RUN npm install -g serve

CMD serve -s build


# run phase using nginx {for production build}
# FROM nginx
# COPY --from=builder /usr/app/build /usr/share/nginx/html
