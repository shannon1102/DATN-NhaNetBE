import { Request, Response } from "express";
import configs from "../../configs";
import ROLES from "../../constants/roles";
import codes from "../../errors/codes";
import CustomError from "../../errors/customError";
import depositService from "../deposit/services";
import productService from "../product/services";
import { Deposit } from "../../entities/deposit/deposit";
import { Product } from "../../entities/product/product";

const stripe = require('stripe')(process.env.STRIPE_SK)
const createPayment = async (req: Request, res: Response) => {
  let { productId, price, customerName,
    customerEmail, customerPhone,
    customerAddress,
    paymentMethod,
    status,
    comment,
    tilte,
    ownerName,
    ownerEmail
  } = req.body;
  let userId = req.user.id;
  const newDeposit = new Deposit();
  const newProduct = new Product();
  newProduct.status = "Sold"
  newDeposit.userId = userId;

  newDeposit.productId = productId;
  newDeposit.price = price;
  newDeposit.customerAddress = customerAddress;
  newDeposit.customerEmail = customerEmail;
  newDeposit.customerName = customerName;
  newDeposit.customerPhone = customerPhone;
  newDeposit.ownerName = ownerName;
  newDeposit.ownerEmail = ownerEmail;
  newDeposit.paymentMethod = "Card";
  newDeposit.status = "Success"


  try {

    console.log("Aloooooo", newDeposit)
    await depositService.createDeposit(newDeposit);
    await productService.updateProduct(productId, newProduct);

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      mode: "payment",
      line_items: [
        {
          // price:'price_1MfoxxAbg9lH9IyvhkeZboNK',
          price_data: {
            currency: 'vnd',
            unit_amount: + price,
            product_data: {
              name: "Product" + productId,
              description: `Thanh toán đặt cọc với NhaNet sản phẩm :`,
              images: [`http://103.130.214.19:4000/api/v1/media/5`],
              metadata: {
                customerEmail: customerEmail,
                customerPhone: customerPhone,
                customerAddress: customerAddress,
                paymentMethod: paymentMethod,
                status: status
              }
            },
          },
          quantity: 1,

        }
      ],
      success_url: `${process.env.CLIENT_URL}/checkout`,
      cancel_url: `${process.env.CLIENT_URL}/product/${productId}`,
    })
    console.log("sesson", session);


    res.status(200).json({
      status: "success",
      result: session,
    });
    //

  } catch (e) {
    res.status(500).json({ error: e })
  }


};

// const getPayments = async (req: Request, res: Response) => {
//   const { limit, offset, userId } = req.query;
//   const currentUserId: number = req.user?.id;
//   if (!currentUserId) {
//     throw new CustomError(codes.NOT_FOUND);
//   }
//   const data = await paymentService.getPaymentsByUserId(currentUserId, {
//     limit: Number(limit) || configs.MAX_RECORDS_PER_REQ,
//     offset: Number(offset) || 0,
//   });
//   res.status(200).json({
//     status: "success",
//     result: data.payments,
//     total: data.total,
//   });
// };

export default { createPayment };
