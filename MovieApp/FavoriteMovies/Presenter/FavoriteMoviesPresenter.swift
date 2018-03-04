import Foundation

class FavoriteMoviesPresenter: FavoriteMoviesPresenterProtocol {
    var interactor: FavoriteMoviesInteractorProtocol!
    var routing: FavoriteMoviesRoutingProtocol!
    weak var view: FavoriteMoviesViewProtocol!
    var favoriteMovies = [FavoriteMovie]()
    
    func load() {
        interactor.execute {
            self.favoriteMovies = self.interactor.allFavoriteMovies
        }
    }
}

