//
//  CharacterListDomainErrorMapper.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

class CharacterListDomainErrorMapper {
    func map(error: HTTPClientError?) -> CharacterListDomainError {
        switch error {
        case .generic:
            return .generic
        case .badURL:
            return .badURL
        case .emptyList:
            return .emptyList
        case .internetConnection:
            return .internetConnection
        case .parsingError:
            return .parsingError
        case .serverError(let message):
            return .serverError(message)
        default:
            return .generic
        }
    }
}
