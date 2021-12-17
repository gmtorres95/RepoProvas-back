class NoDisciplineFound extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NoDisciplineFound';
  }
}

export default NoDisciplineFound;