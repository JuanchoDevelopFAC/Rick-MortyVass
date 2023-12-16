//
//  SwiftDataContainerType.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation

protocol SwiftDataContainerType {
    func fetchCharacterList() -> [CharacterData]
    func insert(_ characterList: [CharacterData]) async
}
