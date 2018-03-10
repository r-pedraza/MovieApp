import Foundation
import RealmSwift

class FavoriteMoviesStorage {
    private var favoriteMovies = [FavoriteMovie]()
    
    func add(favoriteMovie: FavoriteMovie) {
        favoriteMovies.append(favoriteMovie)
    }
    
    var allFavoriteMovies: [FavoriteMovie] {
        return favoriteMovies
    }
    
    func removeFavoriteMovie(at indexPath: IndexPath) {
        do {
            let realm = try Realm()
            let favoriteMovieToCheck = favoriteMovies[indexPath.row]
            if let favoriteMovie = favoriteMovie(with: favoriteMovieToCheck.id) {
                try realm.write {
                    realm.delete(favoriteMovie)
                }
            }
        } catch let error {
            print("\(error.localizedDescription)")
        }
        favoriteMovies.removeAll()
    }
    
    func saveFavoriteMovie(movie: Movie) {
        do {
            let realm = try Realm()
            let favoriteMovieToCheck = FavoriteMovie().setup(with: movie)
            guard let _ = favoriteMovie(with: favoriteMovieToCheck.id) else {
                try realm.write {
                    realm.add(favoriteMovieToCheck)
                }
                return
            }
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
    private func favoriteMovie(with id: Int) -> FavoriteMovie? {
        let realm = try! Realm()
        guard let favoriteMovie = realm.object(ofType: FavoriteMovie.self, forPrimaryKey: id) else {
            return nil
        }
        return favoriteMovie
    }
}
