//
//  UIViewController+App.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/27.
//

import UIKit

extension UIViewController {
    enum App: String {
        case details
        
        var viewController: UIViewController {
            switch self {
            case .details:
                return UIStoryboard.App.details.storyboard.instantiateViewController(DetailsViewController.self)
            }
        }
        
        func asViewController<T: UIViewController>(_ type: T.Type) -> T {
            (self.viewController as! T)
        }
    }
}

