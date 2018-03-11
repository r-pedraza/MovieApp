import Foundation

struct Movie: Codable, ViewModel {
    var imagePath: String {
        return "http://image.tmdb.org/t/p/w185/\(poster_path ?? "")"
    }
    var poster_path: String?
    let vote_count: Int
    let id: Int
    let video: Bool
    let vote_average: Double
    let title: String
    let popularity: Double
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let backdrop_path: String
    let adult: Bool
    let overview: String
    let release_date: String
}
