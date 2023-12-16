//
//  CharacterListRepository.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

class CharacterListRepository: CharacterListRepositoryType {
    
    private let apiCharacterListDataSource: APICharactersListDataSourceType
    private let errorMapper: CharacterListDomainErrorMapper
    private let cacheDataSource: CacheCharacterListDataSourceType
    
    init(apiCharacterListDataSource: APICharactersListDataSourceType, 
         errorMapper: CharacterListDomainErrorMapper,
         cacheDataSource: CacheCharacterListDataSourceType
    ) {
        self.apiCharacterListDataSource = apiCharacterListDataSource
        self.errorMapper = errorMapper
        self.cacheDataSource = cacheDataSource
    }
    
    func getCharacterList() async -> Result<[Character], CharacterListDomainError> {
        
        let characterListCache = await cacheDataSource.getCharacterList()
        
        if !characterListCache.isEmpty {
            return .success(characterListCache)
        }
        
        let characterListResult = await apiCharacterListDataSource.getCharactersList()
        
        guard case .success(let characterList) = characterListResult else {
            return .failure(errorMapper.map(error: characterListResult.failureValue as? HTTPClientError))
        }

        await cacheDataSource.saveCharacterList(characterList)
        
        return .success(characterList)
    }
}
