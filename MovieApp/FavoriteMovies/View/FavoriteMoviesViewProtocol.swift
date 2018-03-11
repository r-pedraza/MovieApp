import Foundation

protocol FavoriteMoviesViewProtocol: class {
    func reloadData()
    func removeCell(at indexPath: IndexPath) 
}
