import { getRepository } from 'typeorm';
import faker from 'faker';
import TeacherEntity from '../../src/entities/TeacherEntity';

async function createTeacher() {
  const teacher = await getRepository(TeacherEntity).create({
    name: `${faker.name.firstName()} ${faker.name.lastName()}`,
  });
  await getRepository(TeacherEntity).save(teacher);
  return teacher.id;
}

export {
  createTeacher,
};
