ARG BACKEND_API="/api"

FROM node:18-alpine as frontend-build
ARG BACKEND_API
WORKDIR /usr/src/app

RUN --mount=type=bind,source=./package.json,target=package.json \
    --mount=type=cache,target=/root/.npm \
    npm install && \
    mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache && \
    mkdir -p build && chmod -R 777 build
USER node
COPY . .
ENV REACT_APP_API_BASE_URL=$BACKEND_API
RUN npm run build

FROM nginx:alpine as frontend-prod
COPY --from=frontend-build /usr/src/app/build /usr/share/nginx/html
COPY ./nginx/* /etc/nginx/templates/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]