import { getRepository } from 'typeorm';
import faker from 'faker';
import CategoryEntity from '../../src/entities/CategoryEntity';

async function createCategory() {
  const category = await getRepository(CategoryEntity).create({
    category: faker.random.word().slice(0,6),
  });
  await getRepository(CategoryEntity).save(category);
  return category.id;
}

export {
  createCategory,
};
