import Foundation

protocol FavoriteMoviesPresenterProtocol {
    func load()
    var favoriteMovies: [FavoriteMovie] { set get }
}
