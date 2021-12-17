import { Entity, PrimaryGeneratedColumn, Column, OneToOne } from 'typeorm';

@Entity('disciplines')
export default class DisciplineEntity {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  discipline: string;
}
