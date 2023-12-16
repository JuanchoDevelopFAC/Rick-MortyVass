//
//  CharacterListViewModel.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    
    private let characterListUseCase: CharacterListUseCaseType
    private let searchCharacterListUseCase: SearchCharacterListUseCaseType
    
    @Published var showLoadingSpinner: Bool = false
    @Published var showAlert: Bool = false
    @Published var textError: String = ""
    @Published var characterList: [Character] = []
    
    init(characterListUseCase: CharacterListUseCaseType, searchCharacterListUseCase: SearchCharacterListUseCaseType) {
        self.characterListUseCase = characterListUseCase
        self.searchCharacterListUseCase = searchCharacterListUseCase
    }
    
    func getCharacterList() {
        showLoadingSpinner = true
        
        Task { @MainActor in
            let result = await characterListUseCase.execute()
            
            switch result {
            case .success:
                let characterListResult = try? result.get()
                
                guard let characterListResponse = characterListResult else {
                    showLoadingSpinner = false
                    return
                }
                showLoadingSpinner = false
                characterList = characterListResponse
            case .failure(let error):
                showAlert = true
                textError = error.errorCharacterListDomainDescription
                showLoadingSpinner = false
            }
        }
    }
    
    func search(characterName: String) {
        if characterName == "" {
            getCharacterList()
        }
        
        Task { @MainActor in
            let result = await searchCharacterListUseCase.execute(characterName: characterName.lowercased())
            handleResult(result)
        }
    }
    
    private func handleResult(_ result: Result<[Character], CharacterListDomainError>) {
        switch result {
        case .success:
            let characterListResult = try? result.get()
            
            guard let characterListResponse = characterListResult else {
                showLoadingSpinner = false
                return
            }
            showLoadingSpinner = false
            characterList = characterListResponse
        case .failure(let error):
            showLoadingSpinner = false
            switch error {
            case .emptyList, .parsingError:
                characterList = []
            default:
                showAlert = true
                textError = error.errorCharacterListDomainDescription
            }
        }
    }
    
}
