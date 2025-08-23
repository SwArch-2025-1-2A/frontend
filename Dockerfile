FROM node:22-alpine AS base

ENV NEXT_TELEMETRY_DISABLED=1

FROM base AS deps

WORKDIR /app

COPY package*.json ./
RUN npm ci

FROM base AS build

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM base AS runtime

WORKDIR /app

COPY --from=build --chown=node:node /app/.next/standalone ./
COPY --from=build --chown=node:node /app/.next/static ./.next/static
COPY --from=build --chown=node:node /app/public ./public

EXPOSE 3000

USER node
CMD ["node", "server.js"]
