//
//  CharacterListFactory.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

final class CharacterListFactory {
    
    static func create() -> CharacterListView {
        return CharacterListView(characterListViewModel: createViewModel())
    }
    
    private static func createViewModel() -> CharacterListViewModel {
        return CharacterListViewModel(characterListUseCase: createUseCase())
    }
    
    private static func createUseCase() -> CharacterListUseCaseType {
        return CharacterListUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> CharacterListRepositoryType {
        return CharacterListRepository(
            apiCharacterListDataSource: createDataSource(),
            errorMapper: CharacterListDomainErrorMapper())
    }
    
    private static func createDataSource() -> APICharactersListDataSourceType {
        return APICharactersListDataSource(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> URLSessionHTTPClient {
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())
    }
}
