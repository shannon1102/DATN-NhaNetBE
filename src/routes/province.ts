import express from 'express';
import asyncMiddleware from '../middlewares/async';
import provinceControllers from '../modules/address/province/controllers';

const router = express.Router();

router.get('/provinces', asyncMiddleware(provinceControllers.getList));

export default router;
