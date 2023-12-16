//
//  Image+AssetName.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 16/12/23.
//

import SwiftUI

enum AssetName: String {
    case emptyListDark = "EmptyListDark"
    case emptyListLight = "EmptyListLight"
    
    var assetName: String {
        return self.rawValue
    }
}

extension Image {
    init(assetName: AssetName) {
        self.init(assetName.assetName)
    }
}
