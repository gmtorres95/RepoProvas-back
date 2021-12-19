import ValidationError from '../errors/ValidationError';
import Exam from '../interfaces/Exam';
import * as schemas from './schemas';

async function validateNewExam(exam: Exam) {
  const joiValidation = schemas.newExamSchema.validate(exam);
  if (joiValidation.error) throw new ValidationError(joiValidation.error.details[0].message);
}

export {
  validateNewExam,
};
