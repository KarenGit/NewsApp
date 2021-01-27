//
//  NameDescribable.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/25.
//

import Foundation

protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribable {
    var typeName: String { String(describing: Self.self) }
    static var typeName: String { String(describing: self) }
}

extension NSObject: NameDescribable {
    
}
