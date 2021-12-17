import { Request, Response, NextFunction } from 'express';
import * as disciplinesService from '../services/disciplinesService';

async function getDisciplines(req: Request, res: Response, next: NextFunction) {
  try {
    const disciplines = await disciplinesService.getDisciplines();
    res.send(disciplines);
  } catch (error) {
    if (error.name === 'NoDisciplineFound') return res.status(404).send(error.message);
    next(error);
  }
}

export {
  getDisciplines,
};
