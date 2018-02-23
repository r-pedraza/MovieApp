import Foundation
protocol MoviesInteractorProtocol {
    func execute(completionHandler: @escaping () -> Void)
    func movie(at indexPath: IndexPath) -> Movie
    func allMovies() -> [Movie]
}
