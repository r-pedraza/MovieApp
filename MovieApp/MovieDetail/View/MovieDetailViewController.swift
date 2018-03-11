import UIKit

class MovieDetailViewController: UIViewController {
    var presenter: MovieDetailPresenterProtocol!
    var movie: Movie!
    var isChecked: Bool = false
    @IBOutlet weak var movieDetailImageView: UIImageView!
    @IBOutlet weak var movieDetailDescriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        _ = MovieDetailRouting(viewController: self).setup()
    }
    
    @objc func didTapInFavoriteButton(){}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView(with: movie)
         favoriteButtonCheckStatus()
    }
    //MARK: Private Methods
    private func favoriteButtonCheckStatus() {
        let image = isChecked == true ? UIImage(named: "checkStar") : UIImage(named: "uncheckStar")
        favoriteButton.setImage(image, for: .normal)
    }
    //MARK: Actions
    @IBAction func didTapInCloseButton(_ sender: Any) {
        presenter.didTapInCloseButton()
    }
    @IBAction func didTapInfavoriteButton(_ sender: Any) {
        isChecked = !isChecked
        favoriteButtonCheckStatus()
        presenter.save(movie: movie)
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
