import Foundation

enum MapperError: Error {
    case processError(Error)
}

class MoviesMapper: Mapper {
    typealias E = Error
    typealias T = Movies
    
    func process(data: Data) throws -> Movies {
        do {
            return try Movies.decode(data: data)
        } catch let error {
            throw MapperError.processError(error)
        }
    }
    
    func processError(dictionary: [String : Any]) -> Error {
        return "Error processing data \(dictionary)"
    }
}
