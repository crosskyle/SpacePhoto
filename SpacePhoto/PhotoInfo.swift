
//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Kyle Cross on 12/15/17.
//  Copyright © 2017 Kyle Cross. All rights reserved.
//

import Foundation

struct PhotoInfo {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    struct PropertyKey {
        static let title = "title"
        static let description = "explanation"
        static let url = "url"
        static let copyright = "copyright"
    }
    
    init?(json: [String: String]) {
        guard let title = json["title"],
            let description = json["explanation"],
            let urlString = json["url"],
            let url = URL(string: urlString) else { return nil }
        
        self.title = title
        self.description = description
        self.url = url
        self.copyright = json["copyright"]
    }
}
