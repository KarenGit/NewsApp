//
//  NewsTableViewCell.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/26.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet private weak var coverPhotoImage: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coverPhotoImageHeightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    
    
    
    // MARK: - Methods -
    
    func setData(_ metaData: Metadata)  {
        self.categoryLabel.text = metaData.category
        self.titleLabel.text = metaData.title
        let date = metaData.date.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        self.dateLabel.text = dateFormatter.string(from: date)
        self.coverPhotoImage.isLoading = true
        let coverPhoto = Helper.downloadImage(from: metaData.coverPhotoUrl, complition: { (image) in
            self.coverPhotoImageHeightConstraint.constant = image.getAspectRatio(self.coverPhotoImage).height
            self.coverPhotoImage.image = image
            self.coverPhotoImage.isLoading = false
        })
        self.coverPhotoImageHeightConstraint.constant = (coverPhoto?.getAspectRatio(self.coverPhotoImage).height)!
        self.coverPhotoImage.image = coverPhoto
        self.categoryLabel.sizeToFit()
        self.categoryLabel.layer.cornerRadius = 5
    }
}
