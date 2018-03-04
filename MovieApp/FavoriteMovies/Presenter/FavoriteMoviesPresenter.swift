import Foundation

class FavoriteMoviesPresenter: FavoriteMoviesPresenterProtocol {
    var interactor: FavoriteMoviesInteractorProtocol!
    var routing: FavoriteMoviesRoutingProtocol!
    weak var view: FavoriteMoviesViewProtocol!
}
