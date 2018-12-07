//
//  Clans.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Clan {
    
    let tag: String?
    let name: String?
    let description: String?
    let type: String?
    let score: Int?
    let memberCount: Int?
    let requiredScore: Int?
    let donations: Int?

    init(json: JSON) {
        tag = json["tag"] as? String
        name = json["name"] as? String
        description = json["description"] as? String
        type = json["type"] as? String
        score = json["score"] as? Int
        memberCount = json["memberCount"] as? Int
        requiredScore = json["requiredScore"] as? Int
        donations = json["donations"] as? Int
     
    }
}
