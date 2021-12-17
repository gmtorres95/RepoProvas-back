import { Request, Response, NextFunction } from 'express';
import NewExam from '../interfaces/NewExam';
import * as examsService from '../services/examsService';
import * as validations from '../validations.ts/validations';

async function postExam(req: Request, res: Response, next: NextFunction) {
  try {
    const newExam: NewExam = req.body;
    await validations.validateNewExam(newExam);
    await examsService.postExam(newExam);

    res.status(201).send(newExam);
  } catch (error) {
    if (error.name === 'NoCategoryFound') return res.status(404).send(error.message);
    if (error.name === 'NoTeacherDisciplineRelationFound') return res.status(404).send(error.message);
    if (error.code === '23505') return res.status(409).send(error.detail);
    if (error.name === 'ValidationError') return res.status(400).send(error.message);
    next(error);
  }
}

export {
  postExam,
};
