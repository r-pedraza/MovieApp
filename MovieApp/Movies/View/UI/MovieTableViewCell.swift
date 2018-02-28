import UIKit

class MovieTableViewCell: BaseTableViewCell<Movie> {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func setupGUI() {
        titleLabel.text = viewModel.title
        movieImageView.setImage(urlString: viewModel.imagePath, placeholder: #imageLiteral(resourceName: "placeholder"))
    }
}
