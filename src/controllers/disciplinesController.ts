import { Request, Response, NextFunction } from 'express';
import { getRepository } from 'typeorm';
import DisciplineEntity from '../entities/DisciplineEntity';

async function getDisciplines(req: Request, res: Response, next: NextFunction) {
  try {
    const disciplines = await getRepository(DisciplineEntity).find();
    res.send(disciplines);
  } catch (error) {
    next(error);
  }
}

export {
  getDisciplines
};
