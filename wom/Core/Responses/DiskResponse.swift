//
//  DiskResponse.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import Foundation

class DiskResponse: Codable {

    var count: Int
    var results: [DiskEntity]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results = "results"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        results = try container.decode([DiskEntity].self, forKey: .results)
    }
    func encode(to encoder: Encoder) throws {}
}
