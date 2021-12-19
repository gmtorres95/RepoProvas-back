import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable, OneToMany } from 'typeorm';
import ExamEntity from './ExamEntity';
import TeacherEntity from './TeacherEntity';

@Entity('disciplines')
export default class DisciplineEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  discipline: string;

  @Column()
  semester_id: number;

  @OneToMany(() => ExamEntity, exam => exam.discipline)
  exams: ExamEntity[];

  @ManyToMany(() => TeacherEntity, teacher => teacher.id)
  @JoinTable({
    name: 'teachers_disciplines',
    joinColumn: {
        name: 'discipline_id',
        referencedColumnName: 'id'
    },
    inverseJoinColumn: {
        name: 'teacher_id',
        referencedColumnName: 'id'
    }
  })
  teachers: TeacherEntity[];

  getDiscipline() {
    return {
      id: this.id,
      discipline: this.discipline,
      teachers: this.teachers,
    }
  }
}
