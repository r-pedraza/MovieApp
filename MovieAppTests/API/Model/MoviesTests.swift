import XCTest

class MoviesTests: XCTestCase {
    func testMoviesModel() {
        do {
            let movieOne = ["title": "The Maze Runner", "poster_path": "/coss7RgL0NH6g4fC2s5atvf3dFO.jpg", "original_title": "The Maze Runner", "overview": "Set in a post-apocalyptic world, young Thomas is deposited in a community of boys after his memory is erased, soon learning they're all trapped in a maze that will require him to join forces with fellow “runners” for a shot at escape."]
            
            let movieTwo = ["title": "Minions", "poster_path": "/q0R4crx2SehcEEQEkYObktdeFy.jpg", "original_title": "Minions", "overview": "Minions Stuart, Kevin and Bob are recruited by Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world."]
            
            let JSON = ["results": [movieOne, movieTwo]]
            
            let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
            let movies = try Movies.decode(data: jsonData)
        
            if let movie = movies.results.first {
                print(movie)
                XCTAssertNotNil(movie)
                XCTAssertEqual(movie.title, "The Maze Runner")
                XCTAssertEqual(movie.id, 198663)
                XCTAssertEqual(movie.originalTitle, "The Maze Runner")
            }
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
}
