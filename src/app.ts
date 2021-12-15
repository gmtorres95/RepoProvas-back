import './setup';
import 'reflect-metadata';
import connectDatabase from './database';
import express from 'express';
import cors from 'cors';

import categoryRouter from './routers/categoryRouter';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', async (req, res) => res.sendStatus(200));
app.use('/types', categoryRouter);

export async function init () {
  await connectDatabase();
}

export default app;
