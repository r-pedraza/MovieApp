import Foundation

protocol FavoriteMoviesPresenterProtocol {
    func load(reload: Bool, indexPath: IndexPath?) 
    var favoriteMovies: [FavoriteMovie] { set get }
    func removeFavoriteMovie(at indexPath: IndexPath)
}
