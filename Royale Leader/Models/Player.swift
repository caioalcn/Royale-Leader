//
//  Player.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 08/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Player {
    let tag: String?
    let name: String?
    let cardsEarned: Int?
    let battlesPlayed: Int?
    let wins: Int?
    let collectionDayBattlesPlayed: Int?
    
    init(json: JSON) {
        tag = json["tag"] as? String
        name = json["name"] as? String
        cardsEarned = json["cardsEarned"] as? Int
        battlesPlayed = json["battlesPlayed"] as? Int
        wins = json["wins"] as? Int
        collectionDayBattlesPlayed = json["collectionDayBattlesPlayed"] as? Int

    }
}
