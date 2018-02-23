import Foundation

class MoviesPresenter {
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
        let superHero = interactor.movie(at: indexPath)
    }
    
    func superHero(at indexPath: IndexPath) -> Movie {
        return interactor.movie(at: indexPath)
    }
}
