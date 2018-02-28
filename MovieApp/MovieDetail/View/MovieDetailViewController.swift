import UIKit

class MovieDetailViewController: UIViewController {
    var presenter: MovieDetailPresenterProtocol!
    var movie: Movie!
    @IBOutlet weak var movieDetailImageView: UIImageView!
    
    @IBOutlet weak var movieDetailDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        _ = MovieDetailRouting(viewController: self).setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView(with: movie)
    }
}
//MARK: MovieDetailViewProtocol
extension MovieDetailViewController: MovieDetailViewProtocol {
    func setupView(with movie: Movie) {
        movieDetailImageView.setImage(urlString: movie.imagePath, placeholder: #imageLiteral(resourceName: "placeholder"))
        movieDetailDescriptionLabel.text = movie.overview
        title = movie.title
    }
}
