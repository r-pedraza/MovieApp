protocol MovieDetailInteractorProtocol {
    func execute(completionHandler: @escaping () -> Void)
    func save(movie: Movie)
}
