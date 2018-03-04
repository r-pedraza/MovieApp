import Foundation
import RealmSwift

class FavoriteMoviesRepository: Repository {
    private var favoriteMoviesStorage = FavoriteMoviesStorage()
    private var moviesMapper = MoviesMapper()
    
    typealias T = FavoriteMovie

    func fetchAllItems(completionHandler: @escaping ([FavoriteMovie]) -> Void, errorHandler: @escaping (Error) -> Void) {
        do {
            let realm = try Realm()
            let favoriteMovies = realm.objects(FavoriteMovie.self)
            favoriteMovies.forEach(self.favoriteMoviesStorage.add)
            completionHandler(favoriteMoviesStorage.allFavoriteMovies)
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
    func fetchItem(at indexPath: IndexPath) -> FavoriteMovie {
        return favoriteMoviesStorage.allFavoriteMovies[indexPath.row]
    }
    
    var items: [FavoriteMovie] {
        return favoriteMoviesStorage.allFavoriteMovies
    }
}
