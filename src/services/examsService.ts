import { getRepository } from 'typeorm';
import CategoryEntity from '../entities/CategoryEntity';
import ExamEntity from '../entities/ExamEntity';
import TeacherDisciplineRelationEntity from '../entities/TeacherDisciplineRelationEntity';
import NoCategoryFound from '../errors/NoCategoryFound';
import NoTeacherDisciplineRelationFound from '../errors/NoTeacherDisciplineRelationFound';
import Exam from '../interfaces/Exam';

async function postExam(newExam: Exam) {
  const category = await getRepository(CategoryEntity)
    .find({
      id: newExam.category_id,
    });
  if (!category.length) throw new NoCategoryFound('This category does not exist');

  const relation = await getRepository(TeacherDisciplineRelationEntity)
    .find({
      teacher_id: newExam.teacher_id,
      discipline_id: newExam.discipline_id,
    });
  if (!relation.length) throw new NoTeacherDisciplineRelationFound('Invalid teacher/discipline relation');

  await getRepository(ExamEntity).insert(newExam);
}

export {
  postExam,
};
