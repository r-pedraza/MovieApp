import Foundation
protocol MoviesInteractorProtocol {
    func execute(completionHandler: @escaping () -> Void)
    func superHero(at indexPath: IndexPath) -> Movie
    func allSuperHeroes() -> [Movie]
}
