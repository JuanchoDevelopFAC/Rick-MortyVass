//
//  CharactersListResponse.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

struct CharacterList: Hashable, Codable {
    let info: Info
    let results: [Character]
}

struct Info: Hashable, Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Hashable, Codable, Identifiable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginCharacter
    let location: LocationCharacter
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct OriginCharacter: Hashable, Codable {
    let name: String
    let url: String
}

struct LocationCharacter: Hashable, Codable {
    let name: String
    let url: String
}
