//
//  Arena.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Arena {
    let name: String?
    let arena: String?
    let arenaID: Int?
    let trophyLimit: Int?
    
    init(json: JSON) {
        name = json["name"] as? String
        arena = json["arena"] as? String
        arenaID = json["arenaID"] as? Int
        trophyLimit = json["trophyLimit"] as? Int

    }
}
