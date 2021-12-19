import Discipline from './Discipline';
import Exam from './Exam';

interface Teacher {
  id: number;
  name: string;
  disciplines?: Discipline;
  exams?: Exam[];
}

export default Teacher;