import { getRepository } from 'typeorm';
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

  await getRepository(ExamEntity).create(newExam);
  await getRepository(ExamEntity).save(newExam);
}

export {
  postExam,
};
