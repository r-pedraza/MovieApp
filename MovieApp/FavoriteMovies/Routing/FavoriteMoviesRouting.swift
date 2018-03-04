import Foundation

class FavoriteMoviesRouting: FavoriteMoviesRoutingProtocol {
    let viewController: FavoriteMoviesViewController
    
    init(viewController: FavoriteMoviesViewController) {
        self.viewController = viewController
    }
    
    func setup() {
        let repository = FavoriteMoviesRepository()
        let interactor = FavoriteMoviesInteractor(repository: repository)
        let presenter = FavoriteMoviesPresenter()
        presenter.interactor = interactor
        presenter.routing = self
        viewController.presenter = presenter
        presenter.view = viewController
    }
}
