//
//  UIView+Loading.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/26.
//

import UIKit

extension UIView  {
    var isLoading: Bool {
        set {
            (newValue
                ? Loading.showLoading(self, .black, self.backgroundColor)
                : Loading.hideLoading(self))
        }
        get { Loading.isLoading(self) }
    }
}
