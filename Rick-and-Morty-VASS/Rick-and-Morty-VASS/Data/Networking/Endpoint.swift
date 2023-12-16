//
//  Endpoint.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

struct Endpoint {
    let path: String
    let bodyParameters: Data?
    let queryParameters: [String : Any]
    let method: HTTPMethod
}
