import { Request, Response, NextFunction } from 'express';
import NewExam from '../interfaces/NewExam';
import * as examsService from '../services/examsService';

async function postExam(req: Request, res: Response, next: NextFunction) {
  try {
    const newExam: NewExam = req.body;
    await examsService.postExam(newExam);

    res.status(201).send(newExam);
  } catch (error) {
    next(error);
  }
}

export {
  postExam,
};
