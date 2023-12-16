//
//  SwiftDataContainer.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import Foundation
import SwiftData

final class SwiftDataContainer: SwiftDataContainerType {
    static let shared: SwiftDataContainer = SwiftDataContainer()
    
    private let container: ModelContainer
    private let context: ModelContext
    
    private init() {
        let schema = Schema([CharacterData.self])
        container = try! ModelContainer(for: schema, configurations: [])
        context = ModelContext(container)
    }
    
    func fetchCharacterList() -> [CharacterData] {
        let descriptor = FetchDescriptor<CharacterData>()
        
        guard let characterList = try? context.fetch(descriptor) else {
            return []
        }
        
        return characterList
    }
    
    func insert(_ characterList: [CharacterData]) async {
        characterList.forEach { character in
            context.insert(character)
        }
        
        try? context.save()
    }
}
