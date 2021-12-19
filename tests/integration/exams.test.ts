import supertest from 'supertest';
import { getConnection } from 'typeorm';
import app, { init } from '../../src/app';
import Exam from '../../src/interfaces/Exam';
import { createCategory } from '../factories/categoryFactory';
import { createDiscipline } from '../factories/disciplineFactory';
import { returnNewExam } from '../factories/examFactory';
import { createSemester } from '../factories/semesterFactory';
import { createTeacherDisciplineRelation } from '../factories/teacherDisciplineRelationFactory';
import { createTeacher } from '../factories/teacherFactory';
import { clearDatabase } from '../utils/database';

let newExam: Exam;

beforeAll(async () => {
  await init();
  const semesterId = await createSemester();
  const disciplineId = await createDiscipline(semesterId);
  const teacherId = await createTeacher();
  const categoryId = await createCategory();
  await createTeacherDisciplineRelation(teacherId, disciplineId);
  newExam = returnNewExam(categoryId, teacherId, disciplineId);
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
    const categoryId = await createCategory();
    const semesterId = await createSemester();
    const disciplineId = await createDiscipline(semesterId);
    const teacherId = await createTeacher();
    await createTeacherDisciplineRelation(teacherId, disciplineId);
    const invalidExam = await returnNewExam(categoryId + 100, teacherId, disciplineId);

    const result = await supertest(app).post('/exams').send(invalidExam);
    expect(result.status).toBe(404);
    expect(result.text).toBe('This category does not exist');
  });

  it('Answers with status 404 for invalid teacher/discipline relation', async () => {
    const categoryId = await createCategory();
    const semesterId = await createSemester();
    const disciplineId = await createDiscipline(semesterId);
    const teacherId = await createTeacher();
    const invalidExam = await returnNewExam(categoryId, teacherId, disciplineId);

    const result = await supertest(app).post('/exams').send(invalidExam);
    expect(result.status).toBe(404);
    expect(result.text).toBe('Invalid teacher/discipline relation');
  });

  it('Answers with status 400 for invalid request', async () => {
    const categoryId = await createCategory();
    const semesterId = await createSemester();
    const disciplineId = await createDiscipline(semesterId);
    const teacherId = await createTeacher();
    await createTeacherDisciplineRelation(teacherId, disciplineId);
    const invalidExam = await returnNewExam(categoryId, teacherId, disciplineId);
    delete invalidExam.name;

    const result = await supertest(app).post('/exams').send(invalidExam);
    expect(result.status).toBe(400);
  });
});
