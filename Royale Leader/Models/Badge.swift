//
//  Badges.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Badge {
    
    let name: String?
    let category: String?
    let id: Int?
    let image: String?
    
    init(json: JSON) {
        name = json["name"] as? String
        category = json["category"] as? String
        id = json["id"] as? Int
        image = json["image"] as? String

    }
}
