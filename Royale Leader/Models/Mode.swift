//
//  Mode.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Mode {
    let name: String?
    let deck: String?
    let cardLevels: String?
    let overtimeSeconds: Int?
    let players: String?
    let sameDeck: Bool?
    
    init(json: JSON) {
        name = json["name"] as? String
        deck = json["deck"] as? String
        cardLevels = json["cardLevels"] as? String
        overtimeSeconds = json["overtimeSeconds"] as? Int
        players = json["players"] as? String
        sameDeck = json["sameDeck"] as? Bool
    }
}
