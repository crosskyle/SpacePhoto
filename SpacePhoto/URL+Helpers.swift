//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Kyle Cross on 12/15/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
        { URLQueryItem(name: $0.0, value: $0.1) }
        
        return components?.url
    }
}
