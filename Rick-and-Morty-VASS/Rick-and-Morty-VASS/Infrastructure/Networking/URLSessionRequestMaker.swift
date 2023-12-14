//
//  URLSessionRequestMaker.swift
//  Rick-and-Morty-VASS
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import Foundation

class URLSessionRequestMaker {
    
    func url(endpoint: Endpoint, baseURL: String) -> URL? {
        var urlComponents = URLComponents(string: baseURL + endpoint.path)
        let urlQueryParameters = endpoint.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        urlComponents?.queryItems = urlQueryParameters
        
        return urlComponents?.url
    }
    
}
