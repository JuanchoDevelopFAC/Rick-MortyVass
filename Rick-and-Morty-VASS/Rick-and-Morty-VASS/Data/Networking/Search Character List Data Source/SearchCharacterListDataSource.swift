//
//  SearchCharacterListDataSource.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 15/12/23.
//

import Foundation

class APISearchCharacterListDataSource: APISearchCharacterListDataSourceType {
    
    private let baseURL: String = "https://rickandmortyapi.com/api/"
    private let httpClient: HTTPClient
    
    private var queryParameters: [String : Any] = [:]
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func searchCharacterList(characterName: String) async -> Result<CharacterList, HTTPClientError> {
        
        queryParameters["name"] = characterName
        
        let endpoint: Endpoint = Endpoint(
            path: "character",
            bodyParameters: nil,
            queryParameters: queryParameters,
            method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: baseURL)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let charactersList = try? JSONDecoder().decode(CharacterList.self, from: data) else {
            print(String(data: data, encoding: .utf8)!)
            return .failure(.parsingError)
        }

        return .success(charactersList)
    }
                            
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
        return error
    }
}
