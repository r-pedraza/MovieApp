import Foundation

class MoviesRepository: Repository {
    private var moviesStorage = MoviesStorage()
    private var moviesAPIClient = MoviesAPIClient()
    private var moviesMapper = MoviesMapper()
    typealias T = Movie
    
    func fetchAllItems(completionHandler: @escaping ([Movie]) -> Void, errorHandler: @escaping (Error) -> Void)  {
        moviesAPIClient.getMovies(completionhandler: { data in
            DispatchQueue.main.async {
                do {
                    let response = try self.moviesMapper.process(data: data)
                    response.results.forEach(self.moviesStorage.add)
                    completionHandler(self.moviesStorage.allMovies())
                } catch let error {
                    errorHandler(error)
                }
            }
        }, errorHandler: errorHandler)
    }
    
    func fetchItem(at indexPath: IndexPath) -> Movie {
        return moviesStorage.allMovies()[indexPath.row]
    }
    
    var items: [Movie]{
        return moviesStorage.allMovies()
    }
}
