//
//  CharacterListViewModel.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    
    private let characterListUseCase: CharacterListUseCaseType
    
    @Published var showLoadingSpinner: Bool = false
    @Published var showAlert: Bool = false
    @Published var textError: String = ""
    @Published var characterList: [Character] = []
    
    init(characterListUseCase: CharacterListUseCaseType) {
        self.characterListUseCase = characterListUseCase
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
                characterList = characterListResponse.results
            case .failure(let error):
                showAlert = true
                textError = error.errorCharacterListDomainDescription
                showLoadingSpinner = false
            }
        }
    }
    
}
