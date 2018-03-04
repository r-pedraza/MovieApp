import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var interactor: MovieDetailInteractorProtocol!
    var routing: MovieDetailRoutingProtocol!
    weak var view: MovieDetailViewProtocol!
    
    func loadData() {
        interactor.execute {}
    }
    
    func didTapInCloseButton() {
        routing.dismissMovieDetailViewController()
    }
}
