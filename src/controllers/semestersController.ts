import { Request, Response, NextFunction } from 'express';
import * as semestersService from '../services/semestersService';

async function getSemester(req: Request, res: Response, next: NextFunction) {
  try {
    const semesters = await semestersService.getSemesters();
    res.send(semesters);
  } catch (error) {
    if (error.name === 'NoSemesterFound') return res.status(404).send(error.message)
    next(error);
  }
}

export {
  getSemester,
};
