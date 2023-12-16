//
//  SearchCharacterListRepository.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 15/12/23.
//

import Foundation

class SearchCharacterListRepository: SearchCharacterListRepositoryType {
    
    private let apiDataSource: APISearchCharacterListDataSourceType
    private let errorMapper: CharacterListDomainErrorMapper
    
    init(apiDataSource: APISearchCharacterListDataSourceType, errorMapper: CharacterListDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func search(characterName: String) async -> Result<CharacterList, CharacterListDomainError> {
        let characterListResult = await apiDataSource.searchCharacterList(characterName: characterName)
        
        guard case .success(let characterList) = characterListResult else {
            return .failure(errorMapper.map(error: characterListResult.failureValue as? HTTPClientError))
        }
        
        return .success(characterList)
    }
    
}
