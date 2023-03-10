import express from "express";
import asyncMiddleware from "../middlewares/async";
import wardControllers from "../modules/address/ward/controllers";

const router = express.Router();

router.get("/wards", asyncMiddleware(wardControllers.getList));

export default router;
