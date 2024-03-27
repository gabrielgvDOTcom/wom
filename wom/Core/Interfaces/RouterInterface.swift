//
//  RouterInterface.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

open class BaseRouter {
    
    private unowned var _viewController: UIViewController
    private var _temporaryStoredViewController: UIViewController?
    
    public init(viewController: UIViewController) {
        _viewController = viewController
        _temporaryStoredViewController = viewController
    }
}
public extension BaseRouter {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

public protocol RouterInterface: AnyObject {

    func dismiss(animated: Bool)
    func presentAlert(with title: String?, message: String?, actions: [UIAlertAction])
}
extension BaseRouter: RouterInterface {

    public func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }

    public func presentAlert(with title: String?, message: String?, actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.isEmpty ?
            alert.addAction(UIAlertAction(title: "OK", style: .cancel)) :
            actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
