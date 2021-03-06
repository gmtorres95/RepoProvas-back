import supertest from 'supertest';
import { getConnection } from 'typeorm';
import app, { init } from '../../src/app';
import { clearDatabase } from '../utils/database';
import { createDiscipline } from '../factories/disciplineFactory';
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

describe('GET /disciplines', () => {
  it('Answers with status 404', async () => {
    const response = await supertest(app).get('/disciplines');
    expect(response.status).toBe(404);
  });

  it('Answers with status 200 and a list of disciplines', async () => {
    const semester = await createSemester();
    const discipline = await createDiscipline(semester.id);
    const teacher1 = await createTeacher();
    const teacher2 = await createTeacher();
    await createTeacherDisciplineRelation(teacher1.id, discipline.id);
    await createTeacherDisciplineRelation(teacher2.id, discipline.id);

    const response = await supertest(app).get('/disciplines');
    expect(response.status).toBe(200);
    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          id: discipline.id,
          teachers: expect.arrayContaining([
            expect.objectContaining({ id: teacher1.id }),
            expect.objectContaining({ id: teacher2.id }),
          ]),
        }),
      ]),
    );
  });
});
