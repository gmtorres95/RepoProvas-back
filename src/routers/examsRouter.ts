import { Router } from 'express';
import * as examsController from '../controllers/examsController';

const router = new (Router as any)();

router.post('', examsController.postExam);

export default router;