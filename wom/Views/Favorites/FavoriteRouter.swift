//
//  FavoriteRouter.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

final class FavoriteRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Favorite", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: FavoriteView.self)
        super.init(viewController: moduleViewController)
        
        let interactor = FavoriteInteractor()
        let presenter = FavoritePresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension FavoriteRouter: FavoriteRouterInterface {

    func showAlert() {}
    func navigate(to option: FavoriteNavigationOption) {
        switch option {
        case .preview(let item): toPreview(item)
        }
    }
    
    private func toPreview(_ object: DiskEntity) {
        navigationController?.pushRouter(PreviewRouter(disk: object))
    }
}
