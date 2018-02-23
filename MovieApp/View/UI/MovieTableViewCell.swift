import UIKit

class MovieTableViewCell: BaseTableViewCell<Movie> {

    @IBOutlet weak var titleLabel: UILabel!
    override func setupGUI() {
        titleLabel.text = viewModel.title
    }
}
