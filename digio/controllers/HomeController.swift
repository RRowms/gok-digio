//
//  ViewController.swift
//  digio
//
//  Created by Cesar Nalio on 03/12/21.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!

    @IBOutlet weak var digioCashBanner: UIImageView!

    let topReuseIdentifier = "topCollectionViewCell"
    let bottomReuseIdentifier = "bottomCollectionViewCell"

    var topItems = ["https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png", "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png"]
    var bottomItems = ["https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png", "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png", "https://s3-sa-east-1.amazonaws.com/digio-exame/level_up_icon.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let digioCashImg = "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png"
        if let imgdata = NSData(contentsOf: URL(string: digioCashImg)!) {

            let digioCashImg = UIImage(data: imgdata as Data)
            digioCashBanner.image = digioCashImg
            digioCashBanner.layer.masksToBounds = true
            digioCashBanner.layer.cornerRadius = 15

        }
    }

    // MARK: - UICollectionViewDataSource protocol

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == bottomCollectionView) {
            return self.bottomItems.count
        }
        return self.topItems.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if (collectionView == bottomCollectionView) {
            // swiftlint:disable force_cast
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomReuseIdentifier, for: indexPath as IndexPath) as! BottomCollectionViewCell
            // swiftlint:enable force_cast

            let currImage = self.bottomItems[indexPath.row]
            if let data = NSData(contentsOf: URL(string: currImage)!) {
                let cellImage = UIImage(data: data as Data)
                cell.bottomCellImage.image = cellImage

            }

            cell.layer.cornerRadius = 15.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 15

            return cell
        }

        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topReuseIdentifier, for: indexPath as IndexPath) as! TopCollectionViewCell
        // swiftlint:enable force_cast

        let currImage = self.topItems[indexPath.row]
        if let data = NSData(contentsOf: URL(string: currImage)!) {

            let cellImage = UIImage(data: data as Data)
            cell.topCellImage.image = cellImage
            cell.topCellImage.contentMode = .scaleAspectFit
            cell.topCellImage.layer.masksToBounds = true
            cell.topCellImage.layer.cornerRadius = 15

            cell.layer.cornerRadius = 15.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false

        } else {
            return cell
        }

        return cell
    }

    // MARK: - UICollectionViewDelegate protocol

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}
