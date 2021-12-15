import { Router } from 'express';
import * as categoriesController from '../controllers/categoriesController';

const router = new (Router as any)();

router.get('', categoriesController.getCategories);

export default router;