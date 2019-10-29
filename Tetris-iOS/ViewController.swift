
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionV: UICollectionView! {
        didSet {
            collectionV.delegate = self
            collectionV.dataSource = self
        }
    }

    var stage: Stage = Stage()

    override func viewDidLoad() {
        super.viewDidLoad()
        stage.createStage()
        stage.startTimer(collectionV: collectionV)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int( stage.size.width * stage.size.height )
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let x = Int( indexPath.row % Int(stage.size.width) )
        let y = Int( indexPath.row / Int(stage.size.height) )
        let node = stage.nodes[y][x]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! NodeCell
        cell.backgroundColor = .red
        cell.setColor(status: node)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 1.0
        let width = collectionV.bounds.width / stage.size.width  - margin * (stage.size.width+1)
        let height = width
        let size = CGSize(width: width, height: height)
        return size
    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
}


