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

    var topItems: [Spotlight] = []
    var bottomItems: [Product] = []
    var cashBanner: [Cash] = []

    var checkValid: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        if NetworkMonitor.shared.isConnected {
            print("Connected to the internet!")
        } else {
            print("No internet connection!")
            alert(message: "Não foi possível acessar os dados, verique sua conexão com a internet!")
            NetworkMonitor.shared.stopMonitoring()
        }

        do {
            try DigioApiManager.getData { data, error in
                guard let data = data else {
                    print(error as Any)
                    return
                }
                self.topItems = data.spotlight
                self.topCollectionView.reloadData()
                self.bottomItems = data.products
                self.bottomCollectionView.reloadData()

                let digioCashImg = data.cash.bannerURL
                do {
                    self.checkValid = try validateUrl(urlString: digioCashImg)
                } catch {
                    print(error)
                }

                if let imgdata = NSData(contentsOf: URL(string: digioCashImg)!), self.checkValid == true {

                    let digioCashImg = UIImage(data: imgdata as Data)
                    self.digioCashBanner.image = digioCashImg
                    self.digioCashBanner.layer.masksToBounds = true
                    self.digioCashBanner.layer.cornerRadius = 15

                }
            }

        } catch {
            print(error)
            alert(message: "Não foi possível acessar os dados, verique sua conexão com a internet!")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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

            let currImage = self.bottomItems[indexPath.row].imageURL
            do {
                self.checkValid = try validateUrl(urlString: currImage)
            } catch {
                print(error)
            }
            if let data = NSData(contentsOf: URL(string: currImage)!), self.checkValid == true {
                let cellImage = UIImage(data: data as Data)
                cell.bottomCellImage.image = cellImage
            }

            cell.layer.cornerRadius = 15.0
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

        let currImage = self.topItems[indexPath.row].bannerURL
        do {
            self.checkValid = try validateUrl(urlString: currImage)
        } catch {
            print(error)
        }
        if let data = NSData(contentsOf: URL(string: currImage)!), self.checkValid == true {

            let cellImage = UIImage(data: data as Data)
            cell.topCellImage.image = cellImage
            cell.topCellImage.contentMode = .scaleAspectFit
            cell.topCellImage.layer.masksToBounds = true
            cell.topCellImage.layer.cornerRadius = 15

            cell.layer.cornerRadius = 15.0
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

        if (collectionView == bottomCollectionView) {
            let detailViewController =  storyboard?.instantiateViewController(withIdentifier: "DetailController") as? DetailController

            detailViewController?.detailUrl = self.bottomItems[indexPath.row].imageURL
            detailViewController?.detailName = self.bottomItems[indexPath.row].name
            detailViewController?.detailText = self.bottomItems[indexPath.row].productDescription

            self.navigationController?.pushViewController(detailViewController!, animated: true)

        }
    }

}

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
