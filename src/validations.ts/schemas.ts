import joi, { string } from 'joi';

const newExamSchema = joi.object({
  name: joi
    .string()
    .pattern(/^((1\d{3})|(20\d{2}))\.[1-2]$/)
    .message('name must contain a valid year and semester (e.g. 2020.1)')
    .required(),
  category_id: joi
    .number()
    .integer().message('category_id must contain a valid ID')
    .positive().message('category_id must contain a valid ID')
    .required(),
  teacher_id: joi
    .number()
    .integer().message('teacher_id must contain a valid ID')
    .positive().message('teacher_id must contain a valid ID')
    .required(),
  discipline_id: joi
    .number()
    .integer().message('discipline_id must contain a valid ID')
    .positive().message('discipline_id must contain a valid ID')
    .required(),
  link: joi
    .string()
    .pattern(/^(https*:\/\/)*(www.)*.+\/.+\.(pdf|PDF)$/).message('link must be a valid pdf file')
    .max(255)
    .required(),
})

export {
  newExamSchema,
};
