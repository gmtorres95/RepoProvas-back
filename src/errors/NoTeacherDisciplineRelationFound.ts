class NoTeacherDisciplineRelationFound extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NoTeacherDisciplineRelationFound';
  }
}

export default NoTeacherDisciplineRelationFound;