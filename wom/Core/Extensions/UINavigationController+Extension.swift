//
//  UINavigationController+Extension.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

public extension UINavigationController {
    
    func popRouter(_ router: BaseRouter, animated: Bool = true) {
        self.popToViewController(router.viewController, animated: animated)
    }
    func pushRouter(_ router: BaseRouter, animated: Bool = true) {
        self.pushViewController(router.viewController, animated: animated)
    }
    func setRootRouter(_ router: BaseRouter, animated: Bool = true) {
        self.setViewControllers([router.viewController], animated: animated)
    }
}
