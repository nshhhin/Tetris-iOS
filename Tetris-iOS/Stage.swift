
import UIKit

class Stage {
    var level: Int = 0
    var nodes: [[NodeStatus]] = []
    var size: CGSize = CGSize(width: 10, height: 20)
    var timer: Timer!

    func startTimer(collectionV: UICollectionView){
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        timer.fire()
    }

    func createStage(){
        nodes = [
            [.n, .n, .n, .d, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .d, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .d, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .d, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n],
            [.n, .n, .n, .n, .n, .n, .n, .n, .n, .n, .n]
        ]
    }

    func clearStage(){
        nodes = []
        for x in 0..<Int(size.width) {
            var lineNodes: [NodeStatus] = []
            for y in 0..<Int(size.height) {
                lineNodes.append( .n )
            }
            nodes.append( lineNodes )
        }
    }

    @objc func update(_ collectionV: UICollectionView){
        for y in 0..<Int(size.height) - 1 {
            for x in 0..<Int(size.width) {
                print(x,y)
                nodes[x][y+1] = nodes[x][y]
            }
        }
        collectionV.reloadData()
    }
}
