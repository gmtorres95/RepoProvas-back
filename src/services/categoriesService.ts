import { getRepository } from 'typeorm';
import CategoryEntity from '../entities/CategoryEntity';
import Category from '../interfaces/Category';

async function getCategories(): Promise<Category[]> {
  const categories = await getRepository(CategoryEntity).find();
  return categories;
}

export {
  getCategories
};
