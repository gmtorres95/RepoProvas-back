import supertest from 'supertest';
import { getConnection } from 'typeorm';
import app, { init } from '../../src/app';
import { clearDatabase } from '../utils/database';
import { createCategory } from '../factories/categoryFactory';
import { createDiscipline } from '../factories/disciplineFactory';
import { createExam } from '../factories/examFactory';
import { createSemester } from '../factories/semesterFactory';
import { createTeacherDisciplineRelation } from '../factories/teacherDisciplineRelationFactory';
import { createTeacher } from '../factories/teacherFactory';

beforeAll(async () => {
  await init();
});

afterAll(async () => {
  await clearDatabase();
  await getConnection().close();
});

describe('GET /semesters', () => {
  it('Answers with status 404', async () => {
    const response = await supertest(app).get('/semesters');
    expect(response.status).toBe(404);
  });

  it('Answers with status 200 and a list of semesters', async () => {
    const category = await createCategory();
    const semester = await createSemester();
    const discipline = await createDiscipline(semester.id);
    const teacher = await createTeacher();
    await createTeacherDisciplineRelation(teacher.id, discipline.id);
    const exam1 = await createExam(category, teacher, discipline);
    const exam2 = await createExam(category, teacher, discipline);
    exam1.category = category;
    exam2.category = category;


    const response = await supertest(app).get('/semesters');
    expect(response.status).toBe(200);
    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          id: semester.id,
          semester: semester.semester,
          disciplines: expect.arrayContaining([
            expect.objectContaining({
              id: discipline.id,
              discipline: discipline.discipline,
              semester_id: discipline.semester_id,
              exams: expect.arrayContaining([ exam1, exam2 ]),
            }),
          ]),
        }),
      ]),
    );
  });
});
