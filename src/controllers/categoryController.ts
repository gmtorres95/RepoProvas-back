import { Request, Response } from 'express';
import { getRepository } from 'typeorm';
import Category from '../entities/Category';

async function getCategories(req: Request, res: Response) {
  try {
    const result = await getRepository(Category).find();
    res.send(result);
  } catch (error) {
    res.sendStatus(500);
  }
}

export {
  getCategories
};
