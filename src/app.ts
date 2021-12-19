import './setup';
import 'reflect-metadata';
import connectDatabase from './database';
import express from 'express';
import cors from 'cors';

import categoriesRouter from './routers/categoriesRouter';
import disciplinesRouter from './routers/disciplinesRouter';
import examsRouter from './routers/examsRouter';
import teachersRouter from './routers/teachersRouter';
import semesterRouter from './routers/semestersRouter';
import errorHandler from './middlewares/errorHandler';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', async (req, res) => res.sendStatus(200));
app.use('/categories', categoriesRouter);
app.use('/disciplines', disciplinesRouter);
app.use('/teachers', teachersRouter);
app.use('/exams', examsRouter);
app.use('/semesters', semesterRouter);
app.use(errorHandler);

export async function init () {
  await connectDatabase();
}

export default app;
