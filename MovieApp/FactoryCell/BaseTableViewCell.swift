import Foundation
import UIKit

class BaseTableViewCell<VM: ViewModel>: UITableViewCell {
    
    var viewModel: VM! {
        didSet {
            setupGUI()
        }
    }
    
    func setupGUI() {}
}


