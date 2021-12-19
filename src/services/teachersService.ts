import { getRepository } from 'typeorm';
import TeacherEntity from '../entities/TeacherEntity';
import NoTeacherFound from '../errors/NoTeacherFound';
import Teacher from '../interfaces/Teacher';

async function getTeachers(): Promise<Teacher[]> {
  const teachers = await getRepository(TeacherEntity).find({ relations: ['exams', 'exams.discipline', 'exams.category'] });
  if (!teachers.length) throw new NoTeacherFound('There is no registered teacher')
  return teachers;
}

export {
  getTeachers,
};
