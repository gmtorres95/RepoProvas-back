import { Request, Response, NextFunction } from 'express';
import * as teachersService from '../services/teachersService';

async function getTeachers(req: Request, res: Response, next: NextFunction) {
  try {
    const teachers = await teachersService.getTeachers();
    res.send(teachers);
  } catch (error) {
    next(error);
  }
}

export {
  getTeachers,
};
