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
    let tracking: Tracking?
    let badge: Badge?
    let location: Location?
    let members: [Member]? = []
    let participants: Int?
    let battlesPlayed: Int?
    let wins: Int?
    let crowns: Int?
    let warTrophies: Int?
    
    init(json: JSON) {
        tag = json["tag"] as? String
        name = json["name"] as? String
        description = json["description"] as? String
        type = json["type"] as? String
        score = json["score"] as? Int
        memberCount = json["memberCount"] as? Int
        requiredScore = json["requiredScore"] as? Int
        donations = json["donations"] as? Int
        participants = json["participants"] as? Int
        battlesPlayed = json["battlesPlayed"] as? Int
        wins = json["wins"] as? Int
        crowns = json["crowns"] as? Int
        warTrophies = json["warTrophies"] as? Int
        
        if let t = json["tracking"] as? JSON{
            tracking = Tracking(json: t)
        } else {
            tracking = nil
        }
        
        if let b = json["badge"] as? JSON{
            badge = Badge(json: b)
        } else {
            badge = nil
        }
        
        if let l = json["location"] as? JSON{
            location = Location(json: l)
        } else {
            location = nil
        }
        
        if let data = json["members"] as? [JSON] {
            for m in data{
                self.members?.append(Member(json: m))
            }
        }
    }
}
