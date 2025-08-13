FROM node:22-alpine

RUN npx next telemetry disable

WORKDIR /Swarch2A_Frontend

COPY package*.json ./
RUN npm install

COPY . .

# The default value is `prod`
#   `prod` -> production
#   `dev` -> development
ARG APP_MODE=prod
ENV APP_MODE=${APP_MODE}

EXPOSE 3000

RUN npm run pre:${APP_MODE}

CMD [\
	"sh", "-c",\
	"npm run ${APP_MODE:-prod}"\
	]
