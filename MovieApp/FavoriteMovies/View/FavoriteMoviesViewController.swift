import UIKit

class FavoriteMoviesViewController: UIViewController {
    var presenter: FavoriteMoviesPresenterProtocol!
    var tableCellFactory: TableCellFactory!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title = "Favorite Movies"
        _ = FavoriteMoviesRouting(viewController: self).setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
        presenter.load(reload: true, indexPath: nil)
    }
    //MARK: Private Methods
    private func setupTableView() {
        tableCellFactory = TableCellFactory(tableView: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(FavoriteMovieTableViewCell.self)
    }
}

extension FavoriteMoviesViewController: FavoriteMoviesViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func removeCell(at indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}

extension FavoriteMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favoriteMovie = presenter.favoriteMovies[indexPath.row]
        return tableCellFactory.createCell(viewModel: favoriteMovie) as FavoriteMovieTableViewCell
    }
 
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let remove = UITableViewRowAction(style: .normal, title: "Remove") { action, index in
            self.presenter.removeFavoriteMovie(at: index)
        }
        remove.backgroundColor = .red
        return [remove]
    }
}
