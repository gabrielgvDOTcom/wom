//
//  PreviewRouter.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

final class PreviewRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Preview", bundle: nil)

    // MARK: - Module setup -
    init(disk: DiskEntity) {
        let moduleViewController = storyboard.instantiateViewController(ofType: PreviewView.self)
        super.init(viewController: moduleViewController)
        
        let interactor = PreviewInteractor()
        let presenter = PreviewPresenter(view: moduleViewController, interactor: interactor, router: self, disk: disk)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension PreviewRouter: PreviewRouterInterface {}
