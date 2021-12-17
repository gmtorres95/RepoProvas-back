import { Request, Response, NextFunction } from 'express';
import NewExam from '../interfaces/NewExam';
import * as examsService from '../services/examsService';

async function postExam(req: Request, res: Response, next: NextFunction) {
  try {
    const newExam: NewExam = req.body;
    await examsService.postExam(newExam);

    res.status(201).send(newExam);
  } catch (error) {
    if (error.name === 'NoCategoryFound') return res.status(404).send(error.message);
    if (error.name === 'NoTeacherDisciplineRelationFound') return res.status(404).send(error.message);
    if (error.code === '23505') return res.status(409).send(error.detail);
    next(error);
  }
}

export {
  postExam,
};
