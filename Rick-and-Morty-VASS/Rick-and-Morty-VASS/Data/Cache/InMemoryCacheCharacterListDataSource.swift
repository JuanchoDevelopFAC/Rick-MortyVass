//
//  InMemoryCacheCharacterListDataSource.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation

actor InMemoryCacheCharacterListDataSource: CacheCharacterListDataSourceType {
    static let shared: InMemoryCacheCharacterListDataSource = InMemoryCacheCharacterListDataSource()
    
    private init() {}
    
    private var cache: [Character] = []
    
    func getCharacterList() async -> [Character] {
        return cache
    }
    
    func saveCharacterList(_ characterList: [Character]) async {
        self.cache = characterList
    }
}
