import { Router } from 'express';
import * as categoryController from '../controllers/categoryController';

const router = new (Router as any)();

router.get('', categoryController.getCategories);

export default router;