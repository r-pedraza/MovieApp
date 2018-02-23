import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
}

extension MoviesViewController: MoviesViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}
