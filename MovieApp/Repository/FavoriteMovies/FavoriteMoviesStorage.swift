import Foundation

class FavoriteMoviesStorage {
    private var favoriteMovies = [FavoriteMovie]()
    
    func add(favoriteMovie: FavoriteMovie) {
        favoriteMovies.append(favoriteMovie)
    }
    
    var allFavoriteMovies: [FavoriteMovie] {
        return favoriteMovies
    }
}
