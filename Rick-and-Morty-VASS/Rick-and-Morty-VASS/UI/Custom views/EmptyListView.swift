//
//  EmptyListView.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import SwiftUI

struct EmptyListView: View {
    @Environment(\.colorScheme) var screenMode
    
    var body: some View {
        VStack {
            Image(assetName: changeModeNameImage())
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            
            Text("Character not found")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color(colorName: .blackText))
        }
    }
    
    private func changeModeNameImage() -> AssetName {
        switch screenMode {
        case .dark:
            return .emptyListDark
        case .light:
            return .emptyListLight
        default:
            return .emptyListDark
        }
    }
}

#Preview {
    EmptyListView()
}
