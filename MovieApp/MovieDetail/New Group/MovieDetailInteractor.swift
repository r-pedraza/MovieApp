import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol  {
    let favoritesMoviesRepository: FavoriteMoviesRepository
    
    init(repository: FavoriteMoviesRepository) {
        self.favoritesMoviesRepository = repository
    }
    
    func execute(completionHandler: @escaping () -> Void) {}
    
    func save(movie: Movie) {
        favoritesMoviesRepository.saveFavoriteMovie(movie: movie)
    }
}
