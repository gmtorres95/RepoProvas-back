import supertest from 'supertest';
import { getConnection } from 'typeorm';
import app, { init } from '../../src/app';
import Exam from '../../src/interfaces/Exam';
import { createCategory } from '../factories/categoryFactory';
import { clearDatabase } from '../utils/database';
import { createDiscipline } from '../factories/disciplineFactory';
import { createSemester } from '../factories/semesterFactory';
import { createTeacherDisciplineRelation } from '../factories/teacherDisciplineRelationFactory';
import { createTeacher } from '../factories/teacherFactory';
import { returnNewExam } from '../factories/examFactory';

let newExam: Exam;

beforeAll(async () => {
  await init();
  const semester = await createSemester();
  const discipline = await createDiscipline(semester.id);
  const teacher = await createTeacher();
  const category = await createCategory();
  await createTeacherDisciplineRelation(teacher.id, discipline.id);
  newExam = returnNewExam(category, teacher, discipline);
});

afterAll(async () => {
  await clearDatabase();
  await getConnection().close();
});

describe('POST /exams', () => {
  it('Answers with status 201 for valid request', async () => {
    const result = await supertest(app).post('/exams').send(newExam);
    expect(result.status).toBe(201);
  });

  it('Answers with status 409 for duplicated entry', async () => {
    const result = await supertest(app).post('/exams').send(newExam);
    expect(result.status).toBe(409);
  });

  it('Answers with status 404 for invalid category', async () => {
    const category = await createCategory();
    const semester = await createSemester();
    const discipline = await createDiscipline(semester.id);
    const teacher = await createTeacher();
    await createTeacherDisciplineRelation(teacher.id, discipline.id);
    const invalidExam = await returnNewExam(category, teacher, discipline);
    invalidExam.category_id = category.id + 1000;

    const result = await supertest(app).post('/exams').send(invalidExam);
    expect(result.status).toBe(404);
    expect(result.text).toBe('This category does not exist');
  });

  it('Answers with status 404 for invalid teacher/discipline relation', async () => {
    const category = await createCategory();
    const semester = await createSemester();
    const discipline = await createDiscipline(semester.id);
    const teacher = await createTeacher();
    const invalidExam = await returnNewExam(category, teacher, discipline);

    const result = await supertest(app).post('/exams').send(invalidExam);
    expect(result.status).toBe(404);
    expect(result.text).toBe('Invalid teacher/discipline relation');
  });

  it('Answers with status 400 for invalid request', async () => {
    const category = await createCategory();
    const semester = await createSemester();
    const discipline = await createDiscipline(semester.id);
    const teacher = await createTeacher();
    await createTeacherDisciplineRelation(teacher.id, discipline.id);
    const invalidExam = await returnNewExam(category, teacher, discipline);
    delete invalidExam.name;

    const result = await supertest(app).post('/exams').send(invalidExam);
    expect(result.status).toBe(400);
  });
});
