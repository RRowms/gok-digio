//
//  DetailController.swift
//  digio
//
//  Created by Cesar Nalio on 10/12/21.
//

import UIKit

class DetailController: UIViewController {

    var detailUrl = ""
    var detailName = ""
    var detailText = ""
    var checkValid: Bool = true

    @IBOutlet weak var detailImageView: UIView!
    @IBOutlet weak var detailContainerView: UIView!
    @IBOutlet weak var detailimage: UIImageView!

    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var detailTextView: UIView!
    @IBOutlet weak var detailContainerText: UIView!
    @IBOutlet weak var detailTextBox: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        detailLabel.text = detailUrl

        detailImageView.layer.cornerRadius = 15.0
        detailImageView.layer.borderWidth = 0.0
        detailImageView.layer.shadowColor = UIColor.black.cgColor
        detailImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        detailImageView.layer.shadowRadius = 3.0
        detailImageView.layer.shadowOpacity = 0.2
        detailImageView.layer.masksToBounds = false
        detailContainerView.layer.masksToBounds = true
        detailContainerView.layer.cornerRadius = 15

        detailTextView.layer.cornerRadius = 15.0
        detailTextView.layer.borderWidth = 0.0
        detailTextView.layer.shadowColor = UIColor.black.cgColor
        detailTextView.layer.shadowOffset = CGSize(width: 0, height: 3)
        detailTextView.layer.shadowRadius = 3.0
        detailTextView.layer.shadowOpacity = 0.2
        detailTextView.layer.masksToBounds = false
        detailContainerText.layer.masksToBounds = true
        detailContainerText.layer.cornerRadius = 15
        detailTextBox.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        detailimage.image = UIImage(named: "not_found")

        let currImage = detailUrl
        do {
            self.checkValid = try ValidatorsModel().validateUrl(urlString: currImage)
        } catch {
            print(error)
        }
        if let data = NSData(contentsOf: URL(string: currImage)!), self.checkValid == true {
            if let cellImage = UIImage(data: data as Data) {
                detailimage.image = cellImage
            }
        }

        detailLabel.text = detailName
        detailTextBox.text = detailText
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
