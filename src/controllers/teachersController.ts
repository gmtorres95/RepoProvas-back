import { Request, Response, NextFunction } from 'express';
import * as teachersService from '../services/teachersService';

async function getTeachers(req: Request, res: Response, next: NextFunction) {
  try {
    const teachers = await teachersService.getTeachers();
    res.send(teachers);
  } catch (error) {
    if (error.name === 'NoTeacherFound') return res.status(404).send(error.message);
    next(error);
  }
}

export {
  getTeachers,
};
