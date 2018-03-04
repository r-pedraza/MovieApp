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
    
    @objc func didTapInFavoriteButton(){}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView(with: movie)
        if let nav = navigationController as? MoviesNavigationController {
            nav.showFavoriteButton()
        }
    }
    
    @IBAction func didTapInCloseButton(_ sender: Any) {
        presenter.didTapInCloseButton()
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
