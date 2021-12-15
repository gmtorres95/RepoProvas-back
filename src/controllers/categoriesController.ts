import { Request, Response } from 'express';
import NoCategoryFound from '../errors/NoCategoryFound';
import * as categoriesService from '../services/categoriesService';

async function getCategories(req: Request, res: Response) {
  try {
    const categories = await categoriesService.getCategories();
    res.send(categories);
  } catch (error) {
    if (error instanceof NoCategoryFound) return res.status(404).send(error.message);
    res.sendStatus(500);
  }
}

export {
  getCategories
};
