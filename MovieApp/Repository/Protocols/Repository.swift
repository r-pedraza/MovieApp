import Foundation

protocol Repository {
    associatedtype T
    func fetchAllItems(completionHandler: @escaping ([T]) -> Void, errorHandler: @escaping (Error) -> Void)
    func fetchItem(at indexPath: IndexPath) -> T
    var items: [T] { get }
}
