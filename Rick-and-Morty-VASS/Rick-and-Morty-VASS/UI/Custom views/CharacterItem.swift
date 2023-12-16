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
        mainSection
    }
    
    var cardSection: some View {
        Rectangle()
            .frame(height: 150)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .foregroundStyle(Color(colorName: .cardBg))
    }
    
    var characterImage: some View {
        AsyncImage(url: URL(string: character.image)!) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                            topLeading: 10,
                            bottomLeading: 10
                            ), style: .continuous))
            } else if phase.error != nil {
                Text(phase.error?.localizedDescription ?? "Error")
                    .frame(width: 150, height: 150)
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                            topLeading: 10,
                            bottomLeading: 10
                            ), style: .continuous))
            } else {
                ProgressView()
                    .frame(width: 150, height: 150)
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                            topLeading: 10,
                            bottomLeading: 10
                            ), style: .continuous))
            }
        }
    }
    
    var characterInfo: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 2) {
                Text(character.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(colorName: .mainText))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                HStack {
                    liveStatus
                    Text("\(character.status) - \(character.species)")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(Color(colorName: .mainText))
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Location")
                    .foregroundStyle(Color(colorName: .secondaryText))
                Text(character.location.name)
                    .foregroundStyle(Color(colorName: .mainText))
            }
            .font(.system(size: 17, weight: .regular))
        }
    }
    
    var mainSection: some View {
        ZStack(alignment: .topLeading) {
            cardSection
            HStack(alignment: .center) {
                characterImage
                characterInfo
            }
        }
    }
    
    var liveStatus: some View {
        switch character.status {
        case "Alive":
            return AnyView(Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(Color(colorName: .alive)))
        case "Dead":
            return AnyView(Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(Color(colorName: .dead)))
        case "unknown":
            return AnyView(Image(systemName: "questionmark")
                .frame(width: 8, height: 8)
                .foregroundStyle(Color(colorName: .mainText))
            )
        default:
            return AnyView(Image(systemName: "questionmark")
                .frame(width: 5, height: 5)
                .foregroundStyle(Color(colorName: .mainText))
            )
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
