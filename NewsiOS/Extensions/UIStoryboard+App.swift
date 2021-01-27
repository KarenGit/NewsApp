//
//  UIStoryboard+App.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/27.
//

import UIKit

extension UIStoryboard {
    enum App: String {
        case details
        
        var storyboard: UIStoryboard {
            UIStoryboard(name: self.rawValue.capitalizedFirstLetter, bundle: nil)
        }
    }
}
