import { Injectable } from '@nestjs/common';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { createTransport } from "nodemailer"

@Injectable()
export class OrdersService {
  constructor(
    private prismaClient: PrismaService

  ){}

  async create(payload: any) {
    // 1. Kiểm tra token -> kiểm tra quyền (role_name) ==> phải login mới đc order

    // 2. Lấy dữ liệu ra

    let { product_id, user_id } = payload

    let orderData = {
      product_id,
      user_id,
      created_date: new Date()
    }

    await this.prismaClient.orders.create({ data: orderData })
    

    return 'This action adds a new order';
  }

  async order() {

    // 1. Gửi email xác nhận
    // console.log("send confirm email")

    const configEmail = createTransport({
        service: "gmail",
        auth: {
          user: "duynguyen.workspace@gmail.com",
          pass: "aplc yzqv yvet ykhm"
        }
    });

    let confirmMail = {
      from: "duynguyen.workspace@gmail.com",
      to: "duynguyen.workspace@gmail.com",
      subject: "Nodeadv04 confirm order mail",
      html: `<h2 style="color: blue">Xac nhan don hang</h2><p>can mua 100 macbook</p>` // index.html -> css (inline CSS)
    }

    configEmail.sendMail(confirmMail, error => error)

    // 2. Tạo order
    // console.log("Tạo order")
    await this.prismaClient.orders.create({
      data: {
        product_id: 1,
        user_id: 1
      }
    })

    // 3. Tạo payment
    // console.log("create payment")
    // -> dung prisma MySQL

    // 4. Tạo shipping
    console.log("create shipping")
    // -> dung prisma MySQL

    // 5. Gửi email thành công đặt hàng
    console.log("send success email")

    let successMail = {
      from: "duynguyen.workspace@gmail.com",
      to: "duynguyen.workspace@gmail.com",
      subject: "Nodeadv04 success order mail",
      html: `<h1 style="color: red">Tao don hang thanh cong</h1><p>mua 100 macbook thanh cong</p>` // index.html -> css (inline CSS)
    }

    configEmail.sendMail(confirmMail, error => error)

  }


  findAll() {
    return `This action returns all orders`;
  }

  findOne(id: number) {
    return `This action returns a #${id} order`;
  }

  update(id: number, updateOrderDto: UpdateOrderDto) {
    return `This action updates a #${id} order`;
  }

  remove(id: number) {
    return `This action removes a #${id} order`;
  }
}
