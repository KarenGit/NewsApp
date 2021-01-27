//
//  UIImage+AspectRatio.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/27.
//

import UIKit

extension UIImage {
    func getAspectRatio(_ imageView: UIImageView) -> CGSize {
        let ratio = self.size.width / self.size.height
        if imageView.frame.width > imageView.frame.height {
            let newHeight = imageView.frame.width / ratio
            return CGSize(width: imageView.frame.width, height: newHeight)
        }
        else {
            let newWidth = imageView.frame.height * ratio
             return CGSize(width: newWidth, height: imageView.frame.height)
        }
    }
}
