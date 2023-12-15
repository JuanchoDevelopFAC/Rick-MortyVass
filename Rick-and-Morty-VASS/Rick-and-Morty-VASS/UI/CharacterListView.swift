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
                    .foregroundStyle(Color(colorName: .mainText))
            } else {
                NavigationView {
                    List(characterListViewModel.characterList) { character in
                        ZStack(alignment: .leading) {
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                EmptyView()
                            }
                            .opacity(0)
                            CharacterItem(character: character)
                        }
                        .listRowSpacing(.infinity)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .navigationTitle("Rick & Morty")
                    .navigationBarTitleDisplayMode(.automatic)
                    .scrollIndicators(.hidden)
                    .padding(-5)
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
