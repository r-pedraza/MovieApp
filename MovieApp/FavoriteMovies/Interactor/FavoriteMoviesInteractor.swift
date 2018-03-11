import Foundation

class FavoriteMoviesInteractor: FavoriteMoviesInteractorProtocol {    
    let favoritesMoviesRepository: FavoriteMoviesRepository
    
    init(repository: FavoriteMoviesRepository) {
        self.favoritesMoviesRepository = repository
    }
    
    func execute(completionHandler: @escaping () -> Void) {
        favoritesMoviesRepository.fetchAllItems(completionHandler: { favoriteMoviesResponse in
            completionHandler()
        }, errorHandler: { error in
            debugPrint(error)
        })
    }
    
    func favoriteMovie(at index: IndexPath) -> FavoriteMovie {
        return favoritesMoviesRepository.fetchItem(at: index)
    }
    
    var allFavoriteMovies: [FavoriteMovie] {
        return favoritesMoviesRepository.items
    }
    
    func removeFavoriteMovie(at indexPath: IndexPath) {
        favoritesMoviesRepository.removeFavoriteMovie(at: indexPath)
    }
}
