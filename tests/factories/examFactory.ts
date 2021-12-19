import { getRepository } from 'typeorm';
import faker from 'faker';
import Exam from '../../src/interfaces/Exam';
import Category from '../../src/interfaces/Category';
import Teacher from '../../src/interfaces/Teacher';
import Discipline from '../../src/interfaces/Discipline';
import ExamEntity from '../../src/entities/ExamEntity';

async function createExam(category: Category, teacher: Teacher, discipline: Discipline) {
  const year = faker.datatype.number({ 'min': 1000, 'max': 2099 });
  const semester = faker.datatype.number({ 'min': 1, 'max': 2});
  const link = `${faker.internet.url()}/${faker.random.word()}.pdf`;
  const exam = await getRepository(ExamEntity).create({
    name: `${year}.${semester}`,
    category_id: category.id,
    teacher_id: teacher.id,
    discipline_id: discipline.id,
    link,
  })
  await getRepository(ExamEntity).save(exam);
  return exam;
}

function returnNewExam(category: Category, teacher: Teacher, discipline: Discipline): Exam {
  const year = faker.datatype.number({ 'min': 1000, 'max': 2099 });
  const semester = faker.datatype.number({ 'min': 1, 'max': 2});
  const link = `${faker.internet.url()}/${faker.random.word()}.pdf`;
  return {
    name: `${year}.${semester}`,
    category_id: category.id,
    teacher_id: teacher.id,
    discipline_id: discipline.id,
    link,
  };
}

export {
  createExam,
  returnNewExam,
};
