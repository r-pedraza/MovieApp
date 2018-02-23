import Foundation

extension String: Error {}

class MoviesAPIClient {
    let baseURL = "https://api.themoviedb.org/3/movie/"
    let APIKey = "b66ffea8276ce576d60df52600822c88"
    var moviesURL: String {
      return "\(baseURL)popular?api_key=\(APIKey)"
    }
    
    func fetchMovies(completionhandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let URL = URL(string: moviesURL) else { return }
        let request = URLRequest(url: URL)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                completionhandler(data)
            } else {
                errorHandler(error ?? "Desconocido")
            }
        }).resume()
    }
}
