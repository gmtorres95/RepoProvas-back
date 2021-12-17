import { getRepository } from 'typeorm';
import ExamEntity from '../entities/ExamEntity';
import NewExam from '../interfaces/NewExam';

async function postExam(newExam: NewExam) {
  await getRepository(ExamEntity).create(newExam);
  await getRepository(ExamEntity).save(newExam);
}

export {
  postExam,
};
