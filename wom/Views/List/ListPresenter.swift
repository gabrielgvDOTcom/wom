//
//  ListPresenter.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Alamofire

final class ListPresenter {

    // MARK: - Private properties -
    private unowned let view: ListViewInterface
    private let interactor: ListInteractorInterface
    private let router: ListRouterInterface

    // MARK: - Lifecycle -
    init(view: ListViewInterface, interactor: ListInteractorInterface, router: ListRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension ListPresenter: ListPresenterInterface {
    
    func viewDidLoad() {
        view.setViewTitle("iTunes")
        fetchData()
    }
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
    
    func pushToFavorites() {
        router.navigate(to: .favorite)
    }
    func pushToPreview(obj disk: DiskEntity) {
        router.navigate(to: .preview(disk))
    }
    func fetchData() {
        view.showProgressHUD()
        interactor.fetchData(country: "us") { [weak self] (response) in
            self?.view.hideProgressHUD()
            self?.handleResult(response)
        }
    }
    
    // MARK: - Private Functions

    private func handleResult(_ result: AFDataResponse<Data>) {
        switch result.result {
        case .success(let data):
            do {
                let items = try JSONDecoder().decode(DiskResponse.self, from: data)
                view.deliver(data: items.results)
            } catch {
                view.setViewError("Error", message: "Ha ocurrido un error")
            }
        case .failure(_):
            view.setViewError("Error", message: "Ha ocurrido un error")
        }
    }
}
