import { getRepository } from 'typeorm';
import faker from 'faker';
import Exam from '../../src/interfaces/Exam';

function returnNewExam(category_id: number, teacher_id: number, discipline_id: number): Exam {
  const year = faker.datatype.number({ 'min': 1000, 'max': 2099 });
  const semester = faker.datatype.number({ 'min': 1, 'max': 2});
  const link = `${faker.internet.url()}/${faker.random.word()}.pdf`;
  return {
    name: `${year}.${semester}`,
    category_id,
    teacher_id,
    discipline_id,
    link,
  };
}

export {
  returnNewExam,
};
