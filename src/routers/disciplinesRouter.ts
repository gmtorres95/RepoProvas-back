import { Router } from 'express';
import * as disciplinesController from '../controllers/disciplinesController';

const router = new (Router as any)();

router.get('', disciplinesController.getDisciplines);

export default router;