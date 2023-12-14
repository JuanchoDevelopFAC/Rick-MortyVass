//
//  CharacterListRepositoryType.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

protocol CharacterListRepositoryType {
    func getCharacterList() async -> Result<CharacterList, CharacterListDomainError>
}
