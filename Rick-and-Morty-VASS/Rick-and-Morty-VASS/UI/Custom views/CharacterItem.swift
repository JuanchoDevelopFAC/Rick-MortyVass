//
//  CharacterItem.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 14/12/23.
//

import SwiftUI

struct CharacterItem: View {
    
    let character: Character
    
    var body: some View {
        characterCard
    }
    
    var characterCard: some View {
        HStack(alignment: .center) {
            characterImage
            characterInfo
                .padding(.horizontal, 15)
            Spacer()
        }
    }
    
    var characterImage: some View {
        AsyncImage(url: URL(string: character.image)!) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else if phase.error != nil {
                Text(phase.error?.localizedDescription ?? "Error")
                    .frame(width: 100, height: 100)
            } else {
                ProgressView()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
            }
        }
    }

    var characterInfo: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(character.name)
                .font(.system(size: 20, weight: .bold))
                .padding(.vertical, 5)
            Text("Gender: \(character.gender)")
                .font(.system(size: 16, weight: .light))
            Text("Species: \(character.species)")
                .font(.system(size: 16, weight: .light))
            Text("Status: \(character.status)")
                .font(.system(size: 16, weight: .light))
        }
    }
}

#Preview {
    let origin: OriginCharacter = OriginCharacter(
        name: "Earth (C-137)",
        url: "https://rickandmortyapi.com/api/location/1"
    )
    
    let location: LocationCharacter = LocationCharacter(
        name: "Citadel of Ricks",
        url: "https://rickandmortyapi.com/api/location/3")
    
    let character: Character = Character(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: origin,
        location: location,
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: ["https://rickandmortyapi.com/api/episode/1",
                  "https://rickandmortyapi.com/api/episode/2",
                  "https://rickandmortyapi.com/api/episode/3"],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z")
    
    return CharacterItem(character: character)
}
