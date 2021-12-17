import { getRepository } from 'typeorm';
import DisciplineEntity from '../entities/DisciplineEntity';
import Discipline from '../interfaces/Discipline';

async function getDisciplines(): Promise<Discipline[]> {
  const disciplines = await getRepository(DisciplineEntity).find();
  return disciplines;
}

export {
  getDisciplines,
};
