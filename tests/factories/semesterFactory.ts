import { getRepository } from 'typeorm';
import faker from 'faker';
import SemesterEntity from '../../src/entities/SemesterEntity';

async function createSemester() {
  const semester = await getRepository(SemesterEntity).create({
    semester: faker.random.word().slice(0,10),
  });
  await getRepository(SemesterEntity).save(semester);
  return semester.id;
}

export {
  createSemester,
};
