import Category from "./Category";
import Discipline from "./Discipline";
import Teacher from "./Teacher";

interface Exam {
  id?: number;
  name: string;
  category_id: number;
  teacher_id: number;
  discipline_id: number;
  link: string;
  teacher?: Teacher;
  discipline: Discipline;
  category: Category;
}

export default Exam;