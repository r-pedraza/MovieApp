import Foundation

class MoviesPresenter: MoviesPresenterProtocol {
    var interactor: MoviesInteractorProtocol!
    var routing: MoviesRoutingProtocol!
    weak var view: MoviesViewProtocol!
    //MARK: MoviesPresenterProtocol
    func execute() {
        interactor.execute(completionHandler: {
            self.view.reloadData()
        })
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        return interactor.allMovies().count
    }
    
    func selectRow(at indexPath: IndexPath) {
        let movie = interactor.movie(at: indexPath)
        routing.load(movie: movie)
    }
    
    func movie(at indexPath: IndexPath) -> Movie {
        return interactor.movie(at: indexPath)
    }
}
