import Foundation

class MoviesStorage {
    private var movies = [Movie]()
    
    func add(movie: Movie) {
        movies.append(movie)
    }
    
    func allMovies() -> [Movie] {
        return movies
    }
}
