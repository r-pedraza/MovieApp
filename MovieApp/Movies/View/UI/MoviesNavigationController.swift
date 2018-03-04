import UIKit

class MoviesNavigationController: UINavigationController {
    override func awakeFromNib() {
        super.awakeFromNib()
        let appearance = UIBarButtonItem.appearance()
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
        appearance.backgroundImage(for: .normal, barMetrics: .default)
        let backIcon = #imageLiteral(resourceName: "back")
        navigationBar.backIndicatorImage = backIcon
        navigationBar.backIndicatorTransitionMaskImage = backIcon
        navigationBar.tintColor = .white
        navigationBar.barStyle = UIBarStyle.blackTranslucent
    }
    
    func showFavoriteButton()  {
        let favoriteButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapInFavoriteButton))
        navigationItem.setRightBarButton(favoriteButton, animated: true)
    }
    
    @objc func didTapInFavoriteButton() {
        print("ou yes!!!!!")
    }
}

