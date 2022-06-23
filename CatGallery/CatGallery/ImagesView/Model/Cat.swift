//
//  Cats.swift
//  CatGallery
//
//  Created by dh on 6/22/22.
//

import Foundation

//MARK: - Cat
struct Cat: Codable {
    
    let id, createdAt: String
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case tags
    }
}

typealias Cats = [Cat]


