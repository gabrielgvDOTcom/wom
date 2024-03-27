//
//  UIStoryboard+Extension.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

public extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
