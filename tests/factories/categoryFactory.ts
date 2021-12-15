import { getRepository } from 'typeorm';
import faker from 'faker';
import CategoryEntity from '../../src/entities/CategoryEntity';

async function createCategory() {
  const categoryName = faker.random.word().slice(0,6);
  const category = await getRepository(CategoryEntity).create({
    category: categoryName,
  });
  await getRepository(CategoryEntity).save(category);
  return categoryName;
}

export {
  createCategory
};
