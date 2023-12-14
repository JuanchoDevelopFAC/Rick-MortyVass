//
//  CharacterListView.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation
import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var characterListViewModel: CharacterListViewModel
    
    init(characterListViewModel: CharacterListViewModel) {
        self.characterListViewModel = characterListViewModel
    }
    
    var body: some View {
        VStack {
            Text("Rick & Morty Characters")
            
            if characterListViewModel.showLoadingSpinner {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                List {
                    ForEach(characterListViewModel.characterList, id: \.id) { character in
                        Text(character.name)
                    }
                }
            }
        }
        .onAppear {
            characterListViewModel.getCharacterList()
        }
        .alert(isPresented: $characterListViewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(characterListViewModel.textError),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    CharacterListFactory.create()
}
