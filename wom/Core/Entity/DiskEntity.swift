//
//  DiskEntity.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import Foundation

class DiskEntity: Codable {

    var id: Int
    var image: String
    var title: String
    var author: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case image = "artworkUrl100"
        case title = "trackName"
        case author = "artistName"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        image = try container.decode(String.self, forKey: .image)
        author = try container.decode(String.self, forKey: .author)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(image, forKey: .image)
        try container.encode(author, forKey: .author)
    }
}
