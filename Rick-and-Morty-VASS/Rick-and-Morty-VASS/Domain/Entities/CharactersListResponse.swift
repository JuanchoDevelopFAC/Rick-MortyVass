//
//  CharactersListResponse.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

struct CharacterList: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct Character: Codable {
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

struct OriginCharacter: Codable {
    let name: String
    let url: String
}

struct LocationCharacter: Codable {
    let name: String
    let url: String
}
