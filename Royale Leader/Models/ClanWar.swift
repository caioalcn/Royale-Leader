//
//  War.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 08/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct ClanWar {
    let state: String?
    let warEndTime: Int?
    let clan: Clan?
    let participants: [Player]? = []
    
    init(json: JSON) {
        state = json["state"] as? String
        warEndTime = json["warEndTime"] as? Int
        if let c = json["clan"] as? JSON {
            clan = Clan(json: c)
        } else {
            clan = nil
        }
        if let p = json["participants"] as? [JSON] {
            for pa in p {
                participants?.append(Player(json: pa))
            }
        }
    }
}
