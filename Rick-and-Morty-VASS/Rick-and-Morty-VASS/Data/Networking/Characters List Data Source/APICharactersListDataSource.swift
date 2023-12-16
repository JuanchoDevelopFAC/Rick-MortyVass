//
//  APICharactersListDataSource.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

class APICharactersListDataSource: APICharactersListDataSourceType {
    private let baseURL: String = "https://rickandmortyapi.com/api/"
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getCharactersList() async -> Result<[Character], HTTPClientError> {
        
        let endpoint: Endpoint = Endpoint(
            path: "character",
            bodyParameters: nil,
            queryParameters: [:],
            method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: baseURL)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let charactersList = try? JSONDecoder().decode(CharacterList.self, from: data) else {
            return .failure(.parsingError)
        }

        return .success(charactersList.results)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
