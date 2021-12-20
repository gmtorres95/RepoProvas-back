import { getRepository } from 'typeorm';
import SemesterEntity from '../entities/SemesterEntity';
import NoSemesterFound from '../errors/NoSemesterFound';

async function getSemesters() {
  const semesters = await getRepository(SemesterEntity).find({ relations: ['disciplines', 'disciplines.exams', 'disciplines.exams.category', 'disciplines.exams.teacher'] });
  if (!semesters.length) throw new NoSemesterFound('There is no registered semester');
  return semesters;
}

export {
  getSemesters,
};
