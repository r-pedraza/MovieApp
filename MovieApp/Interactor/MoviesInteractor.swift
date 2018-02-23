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
    
    func superHero(at index: IndexPath) -> Movie {
        return moviesRepository.fetchItem(at: index)
    }
    
    func allSuperHeroes() -> [Movie] {
        return moviesRepository.items
    }
}
