//
//  Character List.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

protocol CharacterListUseCaseType {
    func execute() async -> Result<[Character], CharacterListDomainError>
}

class CharacterListUseCase: CharacterListUseCaseType {
    
    private let repository: CharacterListRepositoryType
    
    init(repository: CharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Character], CharacterListDomainError> {
        let result = await repository.getCharacterList()
        
        guard let characterList = try? result.get() else {
            
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        return .success(characterList)
    }
}
