import Foundation
import UIKit

class TableCellFactory {
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func createCell<VM, C>(viewModel: VM, indexPath: IndexPath? = nil) -> C
        where C: BaseTableViewCell<VM> {
            let cell: C
            if let indexPath = indexPath {
                cell = tableView.dequeueReusableCell(indexPath: indexPath)
            } else {
                cell = tableView.dequeueReusableCell()
            }
            cell.viewModel = viewModel
            
            return cell
    }
}
