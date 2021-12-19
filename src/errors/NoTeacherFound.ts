class NoTeacherFound extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NoTeacherFound';
  }
}

export default NoTeacherFound;