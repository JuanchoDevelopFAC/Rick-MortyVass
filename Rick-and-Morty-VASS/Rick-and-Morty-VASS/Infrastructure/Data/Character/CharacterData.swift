//
//  CharacterData.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation
import SwiftData

@Model
class CharacterData {
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
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: OriginCharacter, location: LocationCharacter, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
