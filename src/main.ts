import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.enableCors({
    origin: "http://localhost:3000"
  })

  await app.listen(8082);
}
bootstrap();

/* 
TODO: SETUP PRISMA

1. yarn add prisma @prisma/client
2. yarn prisma init
3. cập nhật file .env + prisma.schema
4. yarn prisma db pull
5. bỏ folder prisma vào folder src -> tạo prisma.module, prisma.service
6. yarn prisma generate
*/
