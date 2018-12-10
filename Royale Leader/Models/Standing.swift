//
//  Standings.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 08/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Standing {
    let tag: String?
    let name: String?
    let participants: Int?
    let battlesPlayed: Int?
    let wins: Int?
    let crowns: Int?
    let warTrophies: Int?
    let warTrophiesChange: Int?
    let badge: Badge?
    
    init(json: JSON) {
        tag = json["tag"] as? String
        name = json["name"] as? String
        participants = json["participants"] as? Int
        battlesPlayed = json["battlesPlayed"] as? Int
        wins = json["wins"] as? Int
        crowns = json["crowns"] as? Int
        warTrophies = json["warTrophies"] as? Int
        warTrophiesChange = json["warTrophiesChange"] as? Int
        if let b = json["badge"] as? JSON{
            badge = Badge(json: b)
        } else {
            badge = nil
        }
    }
}
