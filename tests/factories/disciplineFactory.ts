import { getRepository } from 'typeorm';
import faker from 'faker';
import DisciplineEntity from '../../src/entities/DisciplineEntity';

async function createDiscipline(semesterId: number) {
  const discipline = await getRepository(DisciplineEntity).create({
    discipline: faker.random.words(),
    semester_id: semesterId,
  });
  await getRepository(DisciplineEntity).save(discipline);
  return discipline;
}

export {
  createDiscipline,
};
