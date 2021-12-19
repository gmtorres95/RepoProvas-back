import { Entity, PrimaryGeneratedColumn, Column, OneToMany, JoinColumn } from 'typeorm';
import ExamEntity from './ExamEntity';

@Entity('teachers')
export default class TeacherEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  name: string;

  @OneToMany(() => ExamEntity, exam => exam.teacher)
  exams: ExamEntity[];
}
