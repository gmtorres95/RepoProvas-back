import './setup';
import 'reflect-metadata';
import connectDatabase from './database';
import express from 'express';
import cors from 'cors';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', async (req, res) => res.sendStatus(200));

export async function init () {
  await connectDatabase();
}

export default app;
