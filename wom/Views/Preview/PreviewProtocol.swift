//
//  PreviewProtocol.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Alamofire

protocol PreviewViewInterface: ViewInterface {
    
    func deliver(obj disk: DiskEntity)
}
protocol PreviewPresenterInterface: PresenterInterface {
    
    func updateFavorites()
}
protocol PreviewInteractorInterface: InteractorInterface {
    
    func saveFavorite(_ disk: [DiskEntity])
    func getFavorites(_ completion: @escaping ([DiskEntity]) -> Void)
}
protocol PreviewRouterInterface: RouterInterface {}
