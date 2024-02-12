//
//  CharactersDataModel.swift
//  CombineCacheAPICalls
//
//  Created by Rodrigo  Candido on 12/2/24.
//

import Foundation

struct Characters: Codable {
    let info: Info
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Location: Codable {
    let name: String
    let url: String
}
