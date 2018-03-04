import UIKit

class FavoriteMoviesViewController: UIViewController {
    var presenter: FavoriteMoviesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = FavoriteMoviesRouting(viewController: self).setup()
    }
}

extension FavoriteMoviesViewController: FavoriteMoviesViewProtocol {
    
}
