//
//  CharacterDetailView.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 14/12/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .center, spacing: 40) {
                characterImage
                
                Text(character.name)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(Color(colorName: .blackText))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.horizontal, 10)
            }
            
            characterInfo
                .padding(.horizontal, 10)
        }
        Spacer()
    }
    
    var characterImage: some View {
        AsyncImage(url: URL(string: character.image)!) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .clipped()
            } else if phase.error != nil {
                Text(phase.error?.localizedDescription ?? "Error")
            } else {
                ProgressView()
            }
        }
        .frame(width: 350, height: 350)
    }
    
    var characterInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Status: ")
                    .font(.system(size: 17, weight: .bold))
                liveStatus
            }
            
            HStack {
                Text("Gender: ")
                    .font(.system(size: 17, weight: .bold))
                Text(character.gender)
            }
            
            HStack {
                Text("Species: ")
                    .font(.system(size: 17, weight: .bold))
                Text(character.species)
            }
            
            HStack {
                Text("Episodes: ")
                    .font(.system(size: 17, weight: .bold))
                Text("\(character.episode.count)")
            }
            
            HStack {
                Text("Origin: ")
                    .font(.system(size: 17, weight: .bold))
                Text(character.origin.name)
            }
            
            HStack {
                Text("Location: ")
                    .font(.system(size: 17, weight: .bold))
                Text(character.location.name)
            }
        }
    }
    
    var liveStatus: some View {
        switch character.status {
        case "Alive":
            return AnyView(
                Text(character.status)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color(colorName: .alive)))
        case "Dead":
            return AnyView(Text(character.status)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color(colorName: .dead)))
        case "unknown":
            return AnyView(Text(character.status)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color(colorName: .blackText)))
        default:
            return AnyView(Text(character.status)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color(colorName: .blackText)))
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
    
    return CharacterDetailView(character: character)
}
