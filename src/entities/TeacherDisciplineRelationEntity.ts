import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('teachers_disciplines')
export default class TeacherDisciplineRelationEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  teacher_id: number;

  @Column()
  discipline_id: number;
}
