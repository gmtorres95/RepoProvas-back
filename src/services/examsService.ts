import { getRepository } from 'typeorm';
import CategoryEntity from '../entities/CategoryEntity';
import ExamEntity from '../entities/ExamEntity';
import TeacherDisciplineRelationEntity from '../entities/TeacherDisciplineRelationEntity';
import NewExam from '../interfaces/NewExam';

async function postExam(newExam: NewExam) {
  const relation = await getRepository(TeacherDisciplineRelationEntity)
    .find({
      teacher_id: newExam.teacherId,
      discipline_id: newExam.disciplineId,
    });
  if (!relation.length) throw new Error('This teacher does not teach this discipline');

  const category = await getRepository(CategoryEntity)
    .find({
      id: newExam.categoryId,
    });
  if (!category.length) throw new Error('This category does not exist');

  await getRepository(ExamEntity).create(newExam);
  await getRepository(ExamEntity).save(newExam);
}

export {
  postExam,
};
