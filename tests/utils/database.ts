import { getRepository } from 'typeorm';
import CategoryEntity from '../../src/entities/CategoryEntity';
import DisciplineEntity from '../../src/entities/DisciplineEntity';
import ExamEntity from '../../src/entities/ExamEntity';
import SemesterEntity from '../../src/entities/SemesterEntity';
import TeacherDisciplineRelationEntity from '../../src/entities/TeacherDisciplineRelationEntity';
import TeacherEntity from '../../src/entities/TeacherEntity';

async function clearDatabase() {
  await getRepository(TeacherDisciplineRelationEntity).delete({});
  await getRepository(ExamEntity).delete({});
  await getRepository(CategoryEntity).delete({});
  await getRepository(DisciplineEntity).delete({});
  await getRepository(SemesterEntity).delete({});
  await getRepository(TeacherEntity).delete({});
}

export {
  clearDatabase
};
