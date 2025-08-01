# FROM --platform=linux/x86_64 node:20
FROM node

WORKDIR /home/app

COPY package*.json . 

RUN yarn config set network-timeout 3000000
RUN yarn 

# có ORM -> thêm câu lệnh prisma
COPY ./src/prisma ./src/prisma
RUN yarn prisma generate --schema src/prisma/schema.prisma 

COPY . .

EXPOSE 8082

CMD ["yarn", "start"]
