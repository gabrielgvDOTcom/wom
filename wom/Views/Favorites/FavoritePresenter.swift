//
//  FavoritePresenter.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Alamofire

final class FavoritePresenter {

    // MARK: - Private properties -
    private unowned let view: FavoriteViewInterface
    private let interactor: FavoriteInteractorInterface
    private let router: FavoriteRouterInterface

    // MARK: - Lifecycle -
    init(view: FavoriteViewInterface, interactor: FavoriteInteractorInterface, router: FavoriteRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension FavoritePresenter: FavoritePresenterInterface {
    
    func viewDidLoad() {
        view.setViewTitle("Favoritos")
    }
    func viewWillAppear(animated: Bool) {
        fetchData()
    }
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
    
    func deleteFavorite(obj disk: DiskEntity) {
        router.presentAlert(with: "Eliminar", message: "¿Desea eliminar de Favoritos?", actions: [
            UIAlertAction(title: "Cancelar", style: .default),
            UIAlertAction(title: "Eliminar", style: .destructive, handler: { [weak self] action in
                self?.delete(disk)
            })
        ])
    }
    func pushToPreview(obj disk: DiskEntity) {
        router.navigate(to: .preview(disk))
    }
    func fetchData() {
        interactor.getFavorites { [weak self] response in
            if response.isEmpty {
                self?.view.setViewError("Error", message: "No tienes Favoritos")
            } else {
                self?.view.deliver(data: response)
            }
        }
    }
    
    // MARK: - Private functions
    private func delete(_ obj: DiskEntity) {
        interactor.getFavorites { [weak self] response in
            var tmp: [DiskEntity] = response
            if response.contains(where: { $0.image == obj.image }) {
                tmp = tmp.filter { $0.image != obj.image }
                self?.handleResult(tmp)
            }
        }
    }
    private func handleResult(_ obj: [DiskEntity]) {
        interactor.saveFavorite(obj)
        if obj.isEmpty {
            view.deliver(data: [])
            view.setViewError("Error", message: "No tienes Favoritos")
        } else {
            view.deliver(data: obj)
        }
    }
}
