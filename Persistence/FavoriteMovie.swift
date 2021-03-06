import Foundation
import RealmSwift

class FavoriteMovie: Object, ViewModel {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var imagePath = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
        
    func setup(with movie: Movie) -> FavoriteMovie {
        let favoriteMovie = FavoriteMovie()
        favoriteMovie.id = movie.id
        favoriteMovie.title = movie.title
        favoriteMovie.imagePath = movie.imagePath
        return favoriteMovie
    }
}
