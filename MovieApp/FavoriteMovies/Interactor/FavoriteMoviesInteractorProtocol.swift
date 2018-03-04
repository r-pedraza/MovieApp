import Foundation

protocol FavoriteMoviesInteractorProtocol {
    func execute(completionHandler: @escaping () -> Void)
    func favoriteMovie(at index: IndexPath) -> FavoriteMovie 
    var allFavoriteMovies: [FavoriteMovie] { get }
}
