//
//  ListInteractor.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Alamofire

final class ListInteractor {}
extension ListInteractor: ListInteractorInterface {

    func fetchData(country: String, _ completion: @escaping (AFDataResponse<Data>) -> Void) {
        let cl = AF.request("https://itunes.apple.com/search?term=pop&country=\(country)&entity=song&limit=25")
        cl.responseData(completionHandler: completion)
    }
}
