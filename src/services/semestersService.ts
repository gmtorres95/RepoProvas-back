import { getRepository } from 'typeorm';
import SemesterEntity from '../entities/SemesterEntity';

async function getSemesters() {
  const semesters = await getRepository(SemesterEntity).find();
  return semesters;
}

export {
  getSemesters,
};
