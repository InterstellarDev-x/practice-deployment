FROM node:20-alpine
WORKDIR /usr/src/app

# Install bash and curl


# Install Bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"


COPY ./package.json  ./package.json
COPY ./package-lock.json  ./package-lock.json

RUN  bun install 
COPY ./ ./
RUN bun prisma generate


EXPOSE 3000

CMD [ "bun" ,  "run" , "start:backend" ]