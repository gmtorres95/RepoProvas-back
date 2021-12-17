import Teacher from './Teacher';

interface Discipline {
  id: number;
  discipline: string;
  teachers: Teacher[];
}

export default Discipline;