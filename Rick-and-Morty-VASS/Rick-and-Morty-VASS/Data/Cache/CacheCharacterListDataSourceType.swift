//
//  CacheCharacterListDataSourceType.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation

protocol CacheCharacterListDataSourceType {
    func getCharacterList() async -> [Character]
    func saveCharacterList(_ characterList: [Character]) async
}
