import UIKit

class MoviesRouting: MoviesRoutingProtocol {
    private let navigationController: MoviesNavigationController!
    private let viewController: MoviesViewController!
    
    init(navigationController: MoviesNavigationController, viewController: MoviesViewController) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    func setup() {
        let superHeroRepository = MoviesRepository()
        let interactor = MoviesInteractor(repository: superHeroRepository)
        let presenter = MoviesPresenter()
        presenter.interactor = interactor
        presenter.routing = self
        presenter.view = viewController
        viewController.presenter = presenter
    }
}

