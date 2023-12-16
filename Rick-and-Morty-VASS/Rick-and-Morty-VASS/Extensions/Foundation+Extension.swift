//
//  Foundation+Extension.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
