import Foundation

class MovieDetailRouting: MovieDetailRoutingProtocol {
    private let viewController: MovieDetailViewController!
    
    init(viewController: MovieDetailViewController) {
        self.viewController = viewController
    }
    
    func setup() {
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter()
        presenter.interactor = interactor
        presenter.routing = self
        presenter.view = viewController
        viewController.presenter = presenter
    }
    //MARK: MovieDetailRoutingProtocol
    func dismissMovieDetailViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
