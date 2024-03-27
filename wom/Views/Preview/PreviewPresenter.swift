//
//  PreviewPresenter.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

final class PreviewPresenter {

    // MARK: - Private properties -
    private unowned let view: PreviewViewInterface
    private let interactor: PreviewInteractorInterface
    private let router: PreviewRouterInterface
    private let diskModel: DiskEntity

    // MARK: - Lifecycle -
    init(view: PreviewViewInterface, interactor: PreviewInteractorInterface, router: PreviewRouterInterface, disk: DiskEntity) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.diskModel = disk
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension PreviewPresenter: PreviewPresenterInterface {

    func viewDidLoad() {
        view.setViewTitle("Vista Previa")
        view.deliver(obj: diskModel)
    }
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
    
    func updateFavorites() {
        interactor.getFavorites { [weak self] response in
            self?.handleResult(response)
        }
    }
    
    // MARK: - Private functions -
    private func handleResult(_ data: [DiskEntity]) {
        var tmp: [DiskEntity] = data
        if data.contains(where: { $0.image == diskModel.image }) {
            tmp = tmp.filter { $0.image != diskModel.image }
        } else {
            tmp.append(diskModel)
        }
        
        interactor.saveFavorite(tmp)
        router.presentAlert(with: "Bien", message: "Favoritos Actualizados", actions: [])
    }
}
