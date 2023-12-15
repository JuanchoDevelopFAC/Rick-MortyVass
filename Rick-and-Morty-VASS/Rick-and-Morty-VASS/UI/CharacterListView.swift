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
            if characterListViewModel.showLoadingSpinner {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                NavigationStack {
                    List(characterListViewModel.characterList) { character in
                        NavigationLink(destination: CharacterDetailView()) {
                            CharacterItem(character: character)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .padding(.bottom)
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Rick & Morty")
                    .navigationBarTitleDisplayMode(.automatic)
                    .padding(.top, 20)
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
