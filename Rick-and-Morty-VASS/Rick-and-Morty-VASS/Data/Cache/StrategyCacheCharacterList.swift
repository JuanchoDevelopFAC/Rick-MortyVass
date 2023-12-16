//
//  StrategyCacheCharacterList.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation

class StrategyCacheCharacterList: CacheCharacterListDataSourceType {
    
    private let temporalCache: CacheCharacterListDataSourceType
    private let persistenceCache: CacheCharacterListDataSourceType
    
    init(temporalCache: CacheCharacterListDataSourceType, persistenceCache: CacheCharacterListDataSourceType) {
        self.temporalCache = temporalCache
        self.persistenceCache = persistenceCache
    }
    
    func getCharacterList() async -> [Character] {
        let temporalCharacterList = await temporalCache.getCharacterList()
        
        if !temporalCharacterList.isEmpty {
            return temporalCharacterList
        }
        
        let persistenceCharacterList = await persistenceCache.getCharacterList()
        
        await temporalCache.saveCharacterList(persistenceCharacterList)
        
        return persistenceCharacterList
    }
    
    func saveCharacterList(_ characterList: [Character]) async {
        await temporalCache.saveCharacterList(characterList)
        await persistenceCache.saveCharacterList(characterList)
    }
}
