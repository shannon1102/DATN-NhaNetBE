import { Deposit } from "../../entities/deposit/deposit";
import { Pagination } from "../../types/type.pagination";
import { sendEmail } from "../../utils/sendEmail";
import depositDao from "./daos";

const createDeposit = async (deposit: Deposit ) => {
  const newDeposit = await depositDao.createDeposit(deposit);
  let payload ={
    mailTo: [process.env.RECV_EMAIL_BOSS,process.env.RECV_EMAIL_SALE,newDeposit.customerEmail],
    subject: "",
    type:"deposit",
    deposit: newDeposit
  }
  await sendEmail(payload);
  return newDeposit;
};



const getDepositById = async (id: number) => {
  return await depositDao.getDepositById(id);

};


const deleteDepositById = async (id: number) => {
  return await depositDao.deleteDepositById(id);

};


const getUserDeposits = async (userId:number, pagination:Pagination) => {

  return await depositDao.getUserDeposits(userId,pagination);
}
const getAllDeposits = async (params: Pagination) => {
  return await depositDao.getAllDeposits(params);
};

const getAllDepositsByuserId = async (params: Pagination,userId:number) => {
  return await depositDao.getDepositsByUserId(params,userId);
};
const getCountDeposit=async()=>{
return await depositDao.getCountDeposit();
}
export default { getCountDeposit, getUserDeposits, getAllDepositsByuserId, createDeposit,getDepositById,getAllDeposits ,deleteDepositById};
