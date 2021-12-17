import supertest from 'supertest';
import { getConnection } from 'typeorm';
import app, { init } from '../../src/app';
import { createDiscipline } from '../factories/disciplineFactory';
import { createSemester } from '../factories/semesterFactory';
import { createTeacherDisciplineRelation } from '../factories/teacherDisciplineRelationFactory';
import { createTeacher } from '../factories/teacherFactory';
import { clearDatabase } from '../utils/database';

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
    const semesterId = await createSemester();
    const teacherId1 = await createTeacher();
    const teacherId2 = await createTeacher();
    const disciplineId = await createDiscipline(semesterId);
    await createTeacherDisciplineRelation(teacherId1, disciplineId);
    await createTeacherDisciplineRelation(teacherId2, disciplineId);

    const response = await supertest(app).get('/disciplines');
    expect(response.status).toBe(200);
    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          id: disciplineId,
          teachers: expect.arrayContaining([
            expect.objectContaining({ id: teacherId1 }),
            expect.objectContaining({ id: teacherId2 }),
          ]),
        }),
      ]),
    );
  });
});
