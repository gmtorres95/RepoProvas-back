import { getRepository } from 'typeorm';
import CategoryEntity from '../../src/entities/CategoryEntity';

async function clearDatabase() {
  await getRepository(CategoryEntity).delete({});
}

export {
  clearDatabase
};
