import { ProductSearchParams } from "./../../types/type.product";
import { Product } from "../../entities/product/product";
import { Request, Response } from "express";
import productServices from "./services";
import CustomError from "../../errors/customError";
import codes from "../../errors/codes";
import { Media } from "../../entities/media";

const createProduct = async (req: Request, res: Response) => {
    console.log("Eqqqqqqqqqqqqq",req.body);
    let userId = req.user.id 
    const { title, description, status, price, numFloors, numBedRooms, featureImageId,
        squaredMeterArea, lengthMeter, widthMeter,district,ward,city, certificateOfland, houseType, media } = req.body;
    if (!featureImageId) {
        throw new CustomError(codes.BAD_REQUEST, "Missing field featureImageId!");
    }
    if (!media) {
        throw new CustomError(codes.BAD_REQUEST, "Missing field media!");
    }

    const formatMedia: Media[] =
        media?.map((item: number) => {
            return {
                id: item,
            };
        }) || 0;

    const productData: Product = {
        title,
        description,
        status,
        price,
        featureImageId,
        media: formatMedia,
        numFloors,
        numBedRooms,
        squaredMeterArea,
        lengthMeter, 
        widthMeter,
        certificateOfland, 
        houseType,
        city,
        district,
        ward,
        userId
    };
    console.log("Product",productData)
    const newProduct = await productServices.createProduct(productData);
    res.status(200).json({
        status: "success",
        result: newProduct,
    });
};

const getProductById = async (req: Request, res: Response) => {
    const { id } = req.params;
    const product = await productServices.getProductById(Number(id));
    res.status(200).json({
        status: "success",
        result: product,
    });
};

const getProducts = async (req: Request, res: Response) => {
    const { limit, offset, title, status, minPrice, maxPrice, createdAt, userId } = req.query;
    
    console.log("queryy",req.query);
    if (createdAt && createdAt !== "DESC" && createdAt !== "ASC") {
        throw new CustomError(codes.BAD_REQUEST, "createdAt should be DESC or ASC");
    }
    const params: ProductSearchParams = {
        pagination: { limit: Number(limit), offset: Number(offset) },
        title: title as string,
        status: status as string,
        minPrice: Number(minPrice),
        maxPrice: Number(maxPrice),
        createdAt: createdAt as "DESC" | "ASC",
        userId: Number(userId),
    };
    const data = await productServices.getProducts(params);
    res.status(200).json({
        status: "success",
        result: data.products,
        total: data.total,
    });
};

const updateProduct = async (req: Request, res: Response) => {
    const { id } = req.params;
    const data = req.body;
    if (data.media && data.media.length) {
        data.media = data.media.map((item: number) => {
            return {
                id: item,
            };
        });
    }

    const product = await productServices.updateProduct(Number(id), data);
    res.status(200).json({
        status: "success",
        result: product,
    });
};

const deleteProduct = async (req: Request, res: Response) => {
    const { id } = req.params;
    const product = await productServices.deleteProduct(Number(id));
    res.status(200).json({
        status: "success",
        result: product,
    });
};

const productControllers = {
    createProduct,
    getProductById,
    getProducts,
    updateProduct,
    deleteProduct,
};

export default productControllers;
