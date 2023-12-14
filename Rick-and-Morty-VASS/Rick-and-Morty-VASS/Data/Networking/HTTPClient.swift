//
//  HTTPClient.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseURL: String) async -> Result<Data, HTTPClientError>
}
