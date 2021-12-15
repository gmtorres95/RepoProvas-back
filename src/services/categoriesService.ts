import { getRepository } from 'typeorm';
import CategoryEntity from '../entities/CategoryEntity';
import Category from '../interfaces/Category';
import NoCategoryFound from '../errors/NoCategoryFound';

async function getCategories(): Promise<Category[]> {
  const categories = await getRepository(CategoryEntity).find();
  console.log(!categories.length)
  if (!categories.length) throw new NoCategoryFound('There is no registered category');
  return categories;
}

export {
  getCategories
};
