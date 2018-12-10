//
//  Log.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 08/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Log {
    let createdDate: Int?
    let participants: [Player]? = []
    let standings: [Standing]? = []
    let seasonNumber: Int?
    
    init(json: JSON) {
        createdDate = json["createdDate"] as? Int
        if let p = json["participants"] as? [JSON] {
            for pa in p {
                participants?.append(Player(json: pa))
            }
        }
        if let s = json["standings"] as? [JSON] {
            for st in s {
                standings?.append(Standing(json: st))
            }
        }
        seasonNumber = json["seasonNumber"] as? Int
    }
}
