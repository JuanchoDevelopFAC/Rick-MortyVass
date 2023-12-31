//
//  Color+ColorName.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 14/12/23.
//

import SwiftUI

enum ColorName: String {
    case cardBg = "Cardbg"
    case mainText = "MainText"
    case secondaryText = "SecondaryText"
    case alive = "GreenAlive"
    case dead = "RedDead"
    case blackText = "BlackText"
    case bgEmptyList = "BlackEmptyList"
    
    var colorName: String {
        return self.rawValue
    }
}

extension Color {
    init(colorName: ColorName) {
        self.init(colorName.colorName)
    }
}
