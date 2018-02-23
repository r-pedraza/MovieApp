import Foundation

protocol MoviesPresenterProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(at section: Int) -> Int
    func selectRow(at indexPath: IndexPath)
    func movie(at: IndexPath) -> Movie
    func execute()
}
