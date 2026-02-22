# build stage
FROM --platform=$BUILDPLATFORM node:22-alpine AS build-stage
# Set environment variables for non-interactive npm installs
ENV NPM_CONFIG_LOGLEVEL=warn
ENV CI=true

RUN apk add --update python3 make g++\
   && rm -rf /var/cache/apk/*

WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm@9 && pnpm i --ignore-scripts
COPY . .
ARG BASE_URL
ENV BASE_URL=${BASE_URL}
ENV VITE_VERCEL_ENV=production
RUN pnpm build

# production stage
FROM nginxinc/nginx-unprivileged:stable-alpine AS production-stage
ENV VITE_VERCEL_ENV production
ARG BASE_URL
ENV BASE_URL=${BASE_URL}
COPY --from=build-stage /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/templates/default.conf.template
ENV PORT=8080
EXPOSE $PORT

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:${PORT}/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
