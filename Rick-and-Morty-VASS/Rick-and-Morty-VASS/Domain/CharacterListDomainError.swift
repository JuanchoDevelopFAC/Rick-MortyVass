//
//  CharacterListDomainError.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

enum CharacterListDomainError: Error {
    case serverError(String)
    case parsingError
    case generic
    case badURL
    case responseError
    case internetConnection
    case emptyList
    
    var errorCharacterListDomainDescription: String {
        switch self {
        case .serverError(let message):
            return message
        case .parsingError:
            return "Error casting data"
        case .badURL:
            return "The url is incorrect"
        case .responseError:
            return "Exists an error in the response"
        case .internetConnection:
            return "You have not internet connection"
        case .emptyList:
            return "The list is empty"
        case .generic:
            return "Unknown error"
        }
    }
}
