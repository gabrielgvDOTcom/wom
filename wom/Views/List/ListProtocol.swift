//
//  ListProtocol.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Alamofire

enum ListNavigationOption {

    case preview(DiskEntity)
    case favorite
}
protocol ListViewInterface: ViewInterface {
    
    func deliver(data disk: [DiskEntity])
}
protocol ListPresenterInterface: PresenterInterface {
    
    func pushToPreview(obj disk: DiskEntity)
    func pushToFavorites()
    func fetchData()
}
protocol ListInteractorInterface: InteractorInterface {
    
    func fetchData(country: String, _ completion: @escaping (AFDataResponse<Data>) -> Void)
}
protocol ListRouterInterface: RouterInterface {
    
    func showAlert()
    func navigate(to option: ListNavigationOption)
}
