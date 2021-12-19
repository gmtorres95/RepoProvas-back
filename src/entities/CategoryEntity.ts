import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import ExamEntity from './ExamEntity';

@Entity('categories')
export default class CategoryEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  category: string;

  @OneToMany(() => ExamEntity, exam => exam.category)
  exams: ExamEntity[];
}
