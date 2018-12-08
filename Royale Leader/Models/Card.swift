//
//  Card.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 08/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Card {
    let name: String?
    let id: Int?
    let level: Int?
    let maxLevel: Int?
    let rarity: String?
    let requiredForUpgrade: Int?
    let icon: String?
    let key: String?
    let elixir: Int?
    let type: String?
    let arena: Int?
    let description: String?
    
    init(json: JSON) {
        name = json["name"] as? String
        id = json["id"] as? Int
        level = json["level"] as? Int
        maxLevel = json["maxLevel"] as? Int
        rarity = json["rarity"] as? String
        requiredForUpgrade = json["requiredForUpgrade"] as? Int
        icon = json["icon"] as? String
        key = json["key"] as? String
        elixir = json["elixir"] as? Int
        type = json["type"] as? String
        arena = json["arena"] as? Int
        description = json["description"] as? String
    }
}
