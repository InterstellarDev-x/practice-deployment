FROM oven/bun:1 AS base
WORKDIR /usr/src/app




COPY ./package.json  ./package.json
COPY ./package-lock.json  ./package-lock.json

RUN  bun install 
RUN apt-get update -y && apt-get install -y openssl
COPY ./ ./
RUN bun prisma generate


EXPOSE 3000

CMD [ "bun" ,  "run" , "start:backend" ]