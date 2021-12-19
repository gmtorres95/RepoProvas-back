import { Router } from 'express';
import * as semestersController from '../controllers/semestersController';

const router = new (Router as any)();

router.get('', semestersController.getSemester);

export default router;