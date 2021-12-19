import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import CategoryEntity from './CategoryEntity';
import DisciplineEntity from './DisciplineEntity';
import TeacherEntity from './TeacherEntity';

@Entity('exams')
export default class ExamEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  name: string;

  @Column()
  category_id: number;
  
  @Column()
  teacher_id: number;

  @Column()
  discipline_id: number;

  @Column()
  link: string;

  @ManyToOne(() => TeacherEntity, teacher => teacher.exams)
  @JoinColumn({ name: 'teacher_id' })
  teacher: TeacherEntity;

  @ManyToOne(() => DisciplineEntity, discipline => discipline.exams)
  @JoinColumn({ name: 'discipline_id' })
  discipline: DisciplineEntity;

  @ManyToOne(() => CategoryEntity, category => category.exams)
  @JoinColumn({ name: 'category_id' })
  category: CategoryEntity;
}
