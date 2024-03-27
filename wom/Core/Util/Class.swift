//
//  Class.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

public protocol ClassNameProtocol {

    static var className: String { get }
    var className: String { get }
}
public extension ClassNameProtocol {

    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return type(of: self).className
    }
}
extension NSObject: ClassNameProtocol {}
