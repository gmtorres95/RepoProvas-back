import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('categories')
export default class Category {
  @PrimaryGeneratedColumn()
  id: number;
  
  @Column()
  category: string;
}
