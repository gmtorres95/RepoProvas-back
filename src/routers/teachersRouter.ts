import { Router } from 'express';
import * as teachersController from '../controllers/teachersController';

const router = new (Router as any)();

router.get('', teachersController.getTeachers);

export default router;