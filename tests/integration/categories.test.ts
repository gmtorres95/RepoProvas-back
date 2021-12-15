import supertest from "supertest";
import { getConnection } from "typeorm";
import app, { init } from "../../src/app";
import { createCategory } from '../factories/categoryFactory';
import { clearDatabase } from '../utils/database';

beforeAll(async () => {
  await init();
});

afterAll(async () => {
  await clearDatabase();
  await getConnection().close();
});

describe('GET /categories', () => {
  it('Answers with status 404', async () => {
    const response = await supertest(app).get('/categories');
    expect(response.status).toBe(404);
  });

  it('Answers with status 200 and a list of categories', async () => {
    const category = await createCategory();
    const response = await supertest(app).get('/categories');
    expect(response.status).toBe(200);
    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ category })
      ])
    );
  });
});
