//
//  SearchCharacterListRepositoryType.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 15/12/23.
//

import Foundation

protocol SearchCharacterListRepositoryType {
    func search(characterName: String) async -> Result<CharacterList, CharacterListDomainError>
}
