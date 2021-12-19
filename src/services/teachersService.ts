import { getRepository } from 'typeorm';
import TeacherEntity from '../entities/TeacherEntity';
import Teacher from '../interfaces/Teacher';

async function getTeachers() {
  const teachers = await getRepository(TeacherEntity).find({ relations: ['exams', 'exams.discipline', 'exams.category'] });
  return teachers;
}

export {
  getTeachers,
};
