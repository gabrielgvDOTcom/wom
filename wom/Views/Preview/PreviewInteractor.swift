//
//  PreviewInteractor.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

final class PreviewInteractor {}
extension PreviewInteractor: PreviewInteractorInterface {

    func saveFavorite(_ disk: [DiskEntity]) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(disk)
            UserDefaults.standard.set(jsonData, forKey: "favorite")
            UserDefaults.standard.synchronize()
        } catch {
            debugPrint("Error al codificar el arreglo: \(error)")
        }
    }
    func getFavorites(_ completion: @escaping ([DiskEntity]) -> Void) {
        if let jsonData = UserDefaults.standard.data(forKey: "favorite") {
            do {
                let jsonDecoder = JSONDecoder()
                let decodedFav = try jsonDecoder.decode([DiskEntity].self, from: jsonData)
                completion(decodedFav)
            } catch {
                debugPrint("Error al decodificar el arreglo: \(error)")
                completion([])
            }
        } else {
            debugPrint("No se pudo recuperar el arreglo de UserDefaults")
            completion([])
        }
    }
}
