//
//  String+Capitalized.swift
//  NewsiOS
//
//  Created by MAC on 2021/1/27.
//

import Foundation

extension String {
  var capitalizedFirstLetter: String {
        let capitalizedFirstLetter = (self.prefix(1).capitalized + self.dropFirst())
        return capitalizedFirstLetter
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizedFirstLetter
    }
}
