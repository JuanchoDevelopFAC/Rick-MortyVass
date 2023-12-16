//
//  SwiftDataCacheCharacterListDataSource.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation

class SwiftDataCacheCharacterListDataSource: CacheCharacterListDataSourceType {
    private let container: SwiftDataContainerType
    
    init(container: SwiftDataContainerType) {
        self.container = container
    }
    
    func getCharacterList() async -> [Character] {
        let characterList = container.fetchCharacterList()
        
        return characterList.map {
            Character(
                id: $0.id,
                name: $0.name,
                status: $0.status,
                species: $0.species,
                type: $0.type,
                gender: $0.gender,
                origin: $0.origin,
                location: $0.location,
                image: $0.image,
                episode: $0.episode,
                url: $0.url,
                created: $0.created)
        }
    }
    
    func saveCharacterList(_ characterList: [Character]) async {
        let characterListData = characterList.map {
            CharacterData(
                id: $0.id,
                name: $0.name,
                status: $0.status,
                species: $0.species,
                type: $0.type,
                gender: $0.gender,
                origin: $0.origin,
                location: $0.location,
                image: $0.image,
                episode: $0.episode,
                url: $0.url,
                created: $0.created)
        }
        
        await container.insert(characterListData)
    }
}
