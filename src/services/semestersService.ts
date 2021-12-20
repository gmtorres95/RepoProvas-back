import { getRepository } from 'typeorm';
import SemesterEntity from '../entities/SemesterEntity';

async function getSemesters() {
  const semesters = await getRepository(SemesterEntity).find({ relations: ['disciplines', 'disciplines.exams', 'disciplines.exams.category'] });
  return semesters;
}

export {
  getSemesters,
};
