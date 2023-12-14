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
        case .generic, .parsingError, .badURL, .responseError, .internetConnection, .none:
            return .generic
        case .serverError(let message):
            return .serverError(message)
        }
    }
}
