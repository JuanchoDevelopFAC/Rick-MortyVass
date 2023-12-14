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
    
    init(apiCharacterListDataSource: APICharactersListDataSourceType, 
         errorMapper: CharacterListDomainErrorMapper) {
        self.apiCharacterListDataSource = apiCharacterListDataSource
        self.errorMapper = errorMapper
    }
    
    func getCharacterList() async -> Result<CharacterList, CharacterListDomainError> {
        
        let characterListResult = await apiCharacterListDataSource.getCharactersList()
        
        guard case .success(let characterList) = characterListResult else {
            return .failure(errorMapper.map(error: characterListResult.failureValue as? HTTPClientError))
        }

        return .success(characterList)
    }
}
