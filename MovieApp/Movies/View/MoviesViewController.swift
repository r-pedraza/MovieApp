import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: MoviesPresenterProtocol!
    var tableCellFactory: TableCellFactory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = MoviesRouting(viewController: self).setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
        presenter.execute()
    }
    
    private func setupTableView() {
        title = "Movies"
        tableCellFactory = TableCellFactory(tableView: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(MovieTableViewCell.self)
    }
    //MARK: Actions
    @IBAction func didTapInFavoriteButton(_ sender: Any) {
        print("adddddddddd")
    }
}

extension MoviesViewController: MoviesViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}
//MARK: UITableViewDataSource, UITableViewDelegate
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = presenter.movie(at: indexPath)
        return tableCellFactory.createCell(viewModel: movie) as MovieTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.selectRow(at: indexPath)
    }
}
