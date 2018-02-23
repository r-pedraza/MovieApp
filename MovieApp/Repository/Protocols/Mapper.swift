import Foundation

protocol Mapper {
    associatedtype T
    associatedtype E
    func process(data: Data) throws -> T
    func processError(dictionary: [String: Any]) -> E
}
