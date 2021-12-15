class NoCategoryFound extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NoCategoryFound';
  }
}

export default NoCategoryFound;