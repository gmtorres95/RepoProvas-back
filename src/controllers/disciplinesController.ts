import { Request, Response, NextFunction } from 'express';
import * as disciplinesService from '../services/disciplinesService';

async function getDisciplines(req: Request, res: Response, next: NextFunction) {
  try {
    const disciplines = await disciplinesService.getDisciplines();
    res.send(disciplines);
  } catch (error) {
    next(error);
  }
}

export {
  getDisciplines,
};
