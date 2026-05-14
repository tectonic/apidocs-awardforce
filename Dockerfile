FROM node:20-alpine

RUN apk add --no-cache git libsecret

RUN npm install -g mint

WORKDIR /docs

EXPOSE 3000

CMD ["mint", "dev", "--port", "3000"]

