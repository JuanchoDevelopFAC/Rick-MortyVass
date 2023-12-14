//
//  CharacterListDomainError.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

enum CharacterListDomainError: Error {
    case serverError(String)
    case generic
    
    var errorCharacterListDomainDescription: String {
        switch self {
        case .serverError(let message):
            return message
        case .generic:
            return "Unknown error"
        }
    }
}
