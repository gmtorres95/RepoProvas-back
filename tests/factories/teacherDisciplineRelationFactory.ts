import { getManager } from 'typeorm';

async function createTeacherDisciplineRelation(teacherId: number, disciplineId: number) {
  await getManager().query(
    'INSERT INTO teachers_disciplines (teacher_id, discipline_id) VALUES ($1, $2)',
    [teacherId, disciplineId],
  );
}

export {
  createTeacherDisciplineRelation,
};
