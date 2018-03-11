import UIKit

class MoviesRouting {
    private let viewController: MoviesViewController!
    
    init(viewController: MoviesViewController) {
        self.viewController = viewController
    }
    
    func setup() {
        let moviesRepository = MoviesRepository()
        let interactor = MoviesInteractor(repository: moviesRepository)
        let presenter = MoviesPresenter()
        presenter.interactor = interactor
        presenter.routing = self
        presenter.view = viewController
        viewController.presenter = presenter
    }
}

extension MoviesRouting: MoviesRoutingProtocol {
    func load(movie detail: Movie) {
        let storyBoard = UIStoryboard(name: "MovieDetail", bundle: nil)
        if let movieDetailViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailViewControllerID") as? MovieDetailViewController {
            movieDetailViewController.movie = detail
            viewController.present(movieDetailViewController, animated: true, completion: nil)
        }
    }
}

