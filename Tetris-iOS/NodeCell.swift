
import UIKit

class NodeCell: UICollectionViewCell {
    func setColor(status: NodeStatus){
        switch status {
        case .n:
            self.backgroundColor = .black
        case .d:
            self.backgroundColor = .blue
        case .f:
            self.backgroundColor = .red
        }
    }
}
