import './setup';
import 'reflect-metadata';
import connectDatabase from './database';
import express from 'express';
import cors from 'cors';

import categoriesRouter from './routers/categoriesRouter';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', async (req, res) => res.sendStatus(200));
app.use('/categories', categoriesRouter);

export async function init () {
  await connectDatabase();
}

export default app;
