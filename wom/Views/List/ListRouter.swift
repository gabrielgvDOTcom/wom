//
//  ListRouter.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

final class ListRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "List", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ListView.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ListInteractor()
        let presenter = ListPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension ListRouter: ListRouterInterface {

    func showAlert() {}
    func navigate(to option: ListNavigationOption) {
        switch option {
        case .preview(let item): toPreview(item)
        case .favorite: toFavorite()
        }
    }
    
    private func toPreview(_ object: DiskEntity) {
        navigationController?.pushRouter(PreviewRouter(disk: object))
    }
    private func toFavorite() {
        navigationController?.pushRouter(FavoriteRouter())
    }
}
