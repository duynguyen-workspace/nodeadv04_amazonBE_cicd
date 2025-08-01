import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ProductsModule } from './products/products.module';
import { OrdersModule } from './orders/orders.module';
import { UsersModule } from './users/users.module';
import { ShippingModule } from './shipping/shipping.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [ProductsModule, OrdersModule, UsersModule, ShippingModule, PrismaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
