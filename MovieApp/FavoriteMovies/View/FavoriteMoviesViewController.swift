import UIKit

class FavoriteMoviesViewController: UIViewController {
    var presenter: FavoriteMoviesPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        title = "Favorite Movies"
        _ = FavoriteMoviesRouting(viewController: self).setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.load()
        setupTableView()
    }
    //MARK: Private Methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 60
    }
}

extension FavoriteMoviesViewController: FavoriteMoviesViewProtocol {
    
}

extension FavoriteMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let favoriteMovie = presenter.favoriteMovies[indexPath.row]
        return UITableViewCell()
    }
}
