import { getRepository } from 'typeorm';
import DisciplineEntity from '../entities/DisciplineEntity';

async function getDisciplines() {
  const disciplines = await getRepository(DisciplineEntity).find();
  return disciplines;
}

export {
  getDisciplines,
};
