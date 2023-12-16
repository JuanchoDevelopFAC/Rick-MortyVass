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
    @State private var searchCharacter: String = ""
    
    init(characterListViewModel: CharacterListViewModel) {
        self.characterListViewModel = characterListViewModel
    }
    
    var body: some View {
        VStack {
            if characterListViewModel.showLoadingSpinner {
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundStyle(Color(colorName: .mainText))
            } else {
                NavigationStack {
                    if characterListViewModel.characterList.isEmpty {
                        EmptyListView()
                    } else {
                        List(characterListViewModel.characterList) { character in
                            ZStack(alignment: .leading) {
                                NavigationLink(destination: CharacterDetailView(character: character)) {
                                    EmptyView()
                                }
                                .opacity(0)
                                CharacterItem(character: character)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSpacing(.infinity)
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .navigationTitle("Rick & Morty")
                        .navigationBarTitleDisplayMode(.automatic)
                        .scrollIndicators(.hidden)
                    }
                }
                .searchable(text: $searchCharacter)
                    .onChange(of: searchCharacter, {_, newValue in
                        characterListViewModel.search(characterName: newValue)
                    })
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
