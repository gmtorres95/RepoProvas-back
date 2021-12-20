class NoSemesterFound extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NoSemesterFound';
  }
}

export default NoSemesterFound;