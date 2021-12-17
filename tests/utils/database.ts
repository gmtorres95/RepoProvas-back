import { getManager, getRepository } from 'typeorm';
import CategoryEntity from '../../src/entities/CategoryEntity';
import DisciplineEntity from '../../src/entities/DisciplineEntity';
import SemesterEntity from '../../src/entities/SemesterEntity';
import TeacherEntity from '../../src/entities/TeacherEntity';
import ExamEntity from '../../src/entities/ExamEntity';

async function clearDatabase() {
  await getManager().query('DELETE FROM teachers_disciplines');
  await getRepository(ExamEntity).delete({});
  await getRepository(CategoryEntity).delete({});
  await getRepository(DisciplineEntity).delete({});
  await getRepository(SemesterEntity).delete({});
  await getRepository(TeacherEntity).delete({});
}

export {
  clearDatabase
};
