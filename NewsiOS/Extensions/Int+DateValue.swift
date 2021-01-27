//
//  Int+DateValue.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/27.
//

import Foundation

extension Int {
    var dateValue: Date {
        return  Date(timeIntervalSince1970: TimeInterval(self))
    }
}
