import { getRepository } from 'typeorm';
import Category from '../entities/Category';

async function getCategories() {
  const categories = await getRepository(Category).find();
  return categories;
}

export {
  getCategories
};
