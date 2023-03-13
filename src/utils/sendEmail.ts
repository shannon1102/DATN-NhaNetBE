const nodemailer = require("nodemailer");
import dotenv from "dotenv";
import shopInfor from "../constants/shopInfor";
dotenv.config({ path: "./.env" });

export const sendEmail = async (payload: any) => {
  let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: process.env.AUTH_EMAIL, // generated ethereal user
      pass: process.env.AUTH_PASSWORD // generated ethereal password
    },
  });

  // send mail with defined transport object
  if (payload.type == "deposit") {
    let info = await transporter.sendMail({
      from: `From NhaNet Website `, // sender address
      //to: "receiverEmail", // list of receivers
      to: payload.mailTo,
      subject: `NhaNet website have new email`, // Subject line
      html: `
      <h2><b>Deposit Information :</b></h2>
      <div style="margin-left: 30px;">
      <h3>Cutosmer Name:</b> ${payload?.content || "Noinfo"} </h3>
      <p><b>Tên người mua:</b> ${payload?.deposit?.customerName || "Noinfo"} <p>
      <p><b>Email người mua:</b> ${payload?.deposit?.customerEmail || "No info"} <p>
      <p><b>SĐT người mua :</b>: ${payload?.deposit?.customerPhone || "No info"}<p>
      <p><b>Ngày</b>: ${Date.now() || "No info"}<p>
      <p><b>Số tiền</b>: ${payload?.deposit?.price || "No info"}<p>
      </div>
      <div>
      <p> NhaNet - Nhà ấm cơm no <a href="http://localhost:3000">Click Here</a></p>
      </div>
      `, // html body

    });
  }
  if (payload.type == "product") {
    let info = await transporter.sendMail({
      from: `From NhaNet Website `, // sender address
      //to: "receiverEmail", // list of receivers
      to:  payload.mailTo,
      subject: `NhaNet website have new email`, // Subject line
      html: `
      <h2><b>Product mới: </b></h2>
      <div style="margin-left: 30px;">
      <h3>Tên:</b> ${payload?.product?.title || "Noinfo"} </h3>
      <p><b>Mô tả:</b> ${payload?.product?.description || "Noinfo"} <p>
      <p><b>Thành phố:</b> ${payload?.product?.city || "No info"} <p>
      <p><b>Oner Phone</b>: ${payload?.product?.contact || "No info"}<p>
      <p><b>Địa chỉ :</b> ${payload?.product?.detailAddress || "Noinfor"} <p>
      </div>
      <img src= {${process.env.SERVER_URL}/media/${payload?.product?.featureImageId}}></img>
      <div>
      <p> NhaNet - Nhà ấm cơm no <a href="aaaa">Click Here</a></p>
      </div>
      `, // html body

    });
    console.log("Messss", info);
  };
}


