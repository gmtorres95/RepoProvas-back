import { getRepository } from 'typeorm';
import DisciplineEntity from '../entities/DisciplineEntity';
import Discipline from '../interfaces/Discipline';
import NoDisciplineFound from '../errors/NoDisciplineFound';

async function getDisciplines(): Promise<Discipline[]> {
  const disciplines = await getRepository(DisciplineEntity).find({ relations: ['teachers'] });
  if (!disciplines.length) throw new NoDisciplineFound('There is no registered discipline');
  return disciplines.map((discipline) => discipline.getDiscipline());
}

export {
  getDisciplines,
};
