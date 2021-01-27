//
//  DetailsViewController.swift
//  NewsiOS
//
//  Created by MAC on 2021/1/26.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var coverPhotoImage: UIImageView!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var galeryAndVideoButton: UIButton!
    @IBOutlet private weak var coverPhotoImageHeightConstraint: NSLayoutConstraint!
    var metaData: Metadata!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    // MARK: - Private Methods -
    
    private func configureView() {
        self.titleLabel.text = self.metaData.title
        self.categoryLabel.text = self.metaData.category
        let date = metaData.date.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        self.dateLabel.text = dateFormatter.string(from: date)
        let coverPhoto = Helper.downloadImage(from: metaData.coverPhotoUrl, complition: { (image) in
            self.coverPhotoImageHeightConstraint.constant = image.getAspectRatio(self.coverPhotoImage).height
            self.coverPhotoImage.image = image
            self.coverPhotoImage.isLoading = false
        })
        self.coverPhotoImageHeightConstraint.constant = (coverPhoto?.getAspectRatio(self.coverPhotoImage).height)!
        self.bodyLabel.text = self.metaData.body
    }
    
    @IBAction func galeryAndVideoButtonAction(_ sender: UIButton) {
        debugPrint(#function)
    }
}
