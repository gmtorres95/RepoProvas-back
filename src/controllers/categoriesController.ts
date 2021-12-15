import { Request, Response } from 'express';
import * as categoriesService from '../services/categoriesService';

async function getCategories(req: Request, res: Response) {
  try {
    const categories = await categoriesService.getCategories();
    res.send(categories);
  } catch (error) {
    res.sendStatus(500);
  }
}

export {
  getCategories
};
