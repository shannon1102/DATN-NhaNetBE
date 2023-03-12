import { Product } from "../../entities/product/product";
import { getRepository } from "typeorm";
import { ProductSearchParams } from "../../types/type.product";
import { sendEmail } from "../../utils/sendEmail";

const createProduct = async (productData: Product): Promise<Product> => {
  const productRepo = getRepository(Product);
  const newProduct = productRepo.create(productData);
  const product = await productRepo.save(newProduct);
  let payload = {
    mailTo:[process.env.RECV_EMAIL_BOSS,process.env.RECV_EMAIL_SALE],
    subject: "",
    type:"product",
    product: newProduct
  }
  await sendEmail(payload);

  return product;
};

const getProductById = async (id: number): Promise<Product> => {
  const productRepo = getRepository(Product);
  const product = await productRepo
    .createQueryBuilder("p")
    .leftJoinAndSelect("p.mediaMaps", "mm", `mm.targetType='product'`)
    .leftJoinAndSelect("p.user", "user")
    .leftJoinAndSelect("mm.media", "m")
    .leftJoinAndSelect("p.featureImage", "fm")
    .where(`p.id=:id`)
    .setParameters({ id: id })
    .getOne();
  return product;
};

const getProducts = async (params: ProductSearchParams): Promise<{ products: Product[]; total: number }> => {
  const productRepo = getRepository(Product);
  let productQuery = productRepo
    .createQueryBuilder("p")
    // .select(["p.id", "p.title", "p.status", "p.price", "p.description", "p.createdAt", "p.updatedAt"])
    .leftJoinAndSelect("p.mediaMaps", "mm", "mm.targetType='product'")
    .leftJoinAndSelect("p.user", "user")
    .leftJoinAndSelect("mm.media", "m")
    .leftJoinAndSelect("p.featureImage", "fm")
  if (params.collectionId) {
    productQuery = productQuery.andWhere("pc.collectionId=:collectionId", {
      collectionId: params.collectionId,
    });
  }
  if (params.title) {
    productQuery = productQuery.andWhere("p.title like :title", { title: `%${params.title}%` });
  }

  if (params.status) {
    productQuery = productQuery.andWhere("p.status = :status", { status: params.status });
  }
  if (params.maxPrice) {
    productQuery = productQuery.andWhere("p.price < :maxPrice", { maxPrice: params.maxPrice });
  }
  if (params.minPrice) {
    productQuery = productQuery.andWhere("p.price >= :minPrice", { minPrice: params.minPrice });
  }
  if (params.sortPrice) {
    productQuery = productQuery.orderBy("p.price", params.sortPrice);
  } else {
    productQuery = productQuery.orderBy("p.createdAt", params.createdAt ? params.createdAt : "DESC");
  }
  const products = await productQuery.skip(params.pagination.offset).take(params.pagination.limit).getMany();
  const total = await productQuery.getCount();
  return {
    products,
    total,
  };
};

const countProducts = async (): Promise<number> => {
  const productRepo = getRepository(Product);
  let countQuery = productRepo.createQueryBuilder("p");
  const count = await countQuery.getCount();
  return count;
};

const updateProduct = async (id: number, productData: Product): Promise<Product> => {
  const productRepo = getRepository(Product);
  await productRepo.update(id, productData);
  return productData;
};

const deleteProduct = async (id: number) => {
  const productRepo = getRepository(Product);
  await productRepo.delete(id);
};

const productDaos = {
  createProduct,
  getProductById,
  getProducts,
  updateProduct,
  deleteProduct,
  countProducts,
};

export default productDaos;
