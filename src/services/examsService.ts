import { getRepository } from 'typeorm';
import CategoryEntity from '../entities/CategoryEntity';
import ExamEntity from '../entities/ExamEntity';
import TeacherDisciplineRelationEntity from '../entities/TeacherDisciplineRelationEntity';
import NewExam from '../interfaces/NewExam';

async function postExam(newExam: NewExam) {
  const category = await getRepository(CategoryEntity)
    .find({
      id: newExam.category_id,
    });
  if (!category.length) throw new Error('This category does not exist');

  const relation = await getRepository(TeacherDisciplineRelationEntity)
    .find({
      teacher_id: newExam.teacher_id,
      discipline_id: newExam.discipline_id,
    });
  if (!relation.length) throw new Error('This teacher does not teach this discipline');

  await getRepository(ExamEntity).insert(newExam);
}

export {
  postExam,
};
