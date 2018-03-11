import Foundation

class FavoriteMoviesPresenter: FavoriteMoviesPresenterProtocol {
    var interactor: FavoriteMoviesInteractorProtocol!
    var routing: FavoriteMoviesRoutingProtocol!
    weak var view: FavoriteMoviesViewProtocol!
    var favoriteMovies = [FavoriteMovie]()
    
    func load(reload: Bool, indexPath: IndexPath?) {
        interactor.execute {
            self.favoriteMovies = self.interactor.allFavoriteMovies
            if let indexPath = indexPath, reload == false {
                reload ? self.view.reloadData() : self.view.removeCell(at: indexPath)
            } else {
                self.view.reloadData()
            }
        }
    }
    
    func removeFavoriteMovie(at indexPath: IndexPath) {
        interactor.removeFavoriteMovie(at: indexPath)
        self.favoriteMovies.removeAll()
        load(reload: false, indexPath: indexPath)
    }
}

