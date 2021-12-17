import ValidationError from '../errors/ValidationError';
import NewExam from '../interfaces/NewExam';
import * as schemas from './schemas';

async function validateNewExam(exam: NewExam) {
  const joiValidation = schemas.newExamSchema.validate(exam);
  if (joiValidation.error) throw new ValidationError(joiValidation.error.details[0].message);
}

export {
  validateNewExam,
};
