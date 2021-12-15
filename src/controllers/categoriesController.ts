import { NextFunction, Request, Response } from 'express';
import * as categoriesService from '../services/categoriesService';

async function getCategories(req: Request, res: Response, next: NextFunction) {
  try {
    const categories = await categoriesService.getCategories();
    res.send(categories);
  } catch (error) {
    if (error.name === 'NoCategoryFound') return res.status(404).send(error.message);
    next(error);
  }
}

export {
  getCategories
};
