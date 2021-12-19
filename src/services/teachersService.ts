import { getRepository } from 'typeorm';
import Teacher from '../interfaces/Teacher';

async function getTeachers(): Promise<Teacher[]> {
  return [{
    id: 0,
    name: 'mockTeacher',
  }];
}

export {
  getTeachers,
};
