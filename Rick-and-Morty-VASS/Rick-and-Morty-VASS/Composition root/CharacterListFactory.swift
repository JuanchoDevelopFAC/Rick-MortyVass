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
        return CharacterListViewModel(characterListUseCase: createUseCase(), searchCharacterListUseCase: createSearchUseCase())
    }
    
    private static func createUseCase() -> CharacterListUseCaseType {
        return CharacterListUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> CharacterListRepositoryType {
        return CharacterListRepository(
            apiCharacterListDataSource: createDataSource(),
            errorMapper: CharacterListDomainErrorMapper(),
            cacheDataSource: createCacheDataSource()
        )
    }
    
    private static func createCacheDataSource() -> CacheCharacterListDataSourceType {
        StrategyCacheCharacterList(temporalCache: InMemoryCacheCharacterListDataSource.shared, persistenceCache: createPersistenceDataSource())
    }
    
    private static func createPersistenceDataSource() -> CacheCharacterListDataSourceType {
        SwiftDataCacheCharacterListDataSource(container: SwiftDataContainer.shared)
    }
    
    private static func createDataSource() -> APICharactersListDataSourceType {
        return APICharactersListDataSource(httpClient: createHTTPClient())
    }
    
    private static func createSearchUseCase() -> SearchCharacterListUseCaseType {
        return SearchCharacterListUseCase(repository: createSearchRepository())
    }
    
    private static func createSearchRepository() -> SearchCharacterListRepositoryType {
        return SearchCharacterListRepository(apiDataSource: createSearchDataSource(), errorMapper: CharacterListDomainErrorMapper())
    }
    
    private static func createSearchDataSource() -> APISearchCharacterListDataSourceType {
        return APISearchCharacterListDataSource(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> URLSessionHTTPClient {
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())
    }
}
