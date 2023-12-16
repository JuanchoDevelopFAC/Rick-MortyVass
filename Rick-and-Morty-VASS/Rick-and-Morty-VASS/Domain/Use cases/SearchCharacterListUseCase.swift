//
//  SearchCharacterListUseCase.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 15/12/23.
//

import Foundation

protocol SearchCharacterListUseCaseType {
    func execute(characterName: String) async -> Result<[Character], CharacterListDomainError>
}

class SearchCharacterListUseCase: SearchCharacterListUseCaseType {
    
    private let repository: SearchCharacterListRepositoryType
    
    init(repository: SearchCharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute(characterName: String) async -> Result<[Character], CharacterListDomainError> {
        let result = await repository.search(characterName: characterName)
        
        guard let characterList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(characterList.results)
    }
}
