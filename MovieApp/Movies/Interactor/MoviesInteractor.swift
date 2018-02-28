import Foundation

class MoviesInteractor: MoviesInteractorProtocol {
    let moviesRepository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.moviesRepository = repository
    }
    
    func execute(completionHandler: @escaping () -> Void) {
        moviesRepository.fetchAllItems(completionHandler: { superHeroresResponse in
            completionHandler()
        }, errorHandler: { error in
            debugPrint(error)
        })
    }
    
    func movie(at index: IndexPath) -> Movie {
        return moviesRepository.fetchItem(at: index)
    }
    
    func allMovies() -> [Movie] {
        return moviesRepository.items
    }
}
