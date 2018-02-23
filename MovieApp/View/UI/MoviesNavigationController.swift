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
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let search = UISearchController()
        let bar = search.searchBar
        bar.frame = frame
        navigationItem.searchController = search
    }
}

