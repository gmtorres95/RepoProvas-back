import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinTable } from 'typeorm';
import DisciplineEntity from './DisciplineEntity';

@Entity('teachers')
export default class TeacherEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  name: string;
}
