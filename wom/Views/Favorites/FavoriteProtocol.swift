//
//  FavoriteProtocol.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Alamofire

enum FavoriteNavigationOption {

    case preview(DiskEntity)
}
protocol FavoriteViewInterface: ViewInterface {
    
    func deliver(data disk: [DiskEntity])
}
protocol FavoritePresenterInterface: PresenterInterface {
    
    func deleteFavorite(obj disk: DiskEntity)
    func pushToPreview(obj disk: DiskEntity)
    func fetchData()
}
protocol FavoriteInteractorInterface: InteractorInterface {
    
    func saveFavorite(_ disk: [DiskEntity])
    func getFavorites(_ completion: @escaping ([DiskEntity]) -> Void)
}
protocol FavoriteRouterInterface: RouterInterface {
    
    func showAlert()
    func navigate(to option: FavoriteNavigationOption)
}
