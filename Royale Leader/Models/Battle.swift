//
//  Battle.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Battle {
    var type: String?
    let mode: Mode?
    let utcTime: Int?
    let deckType: String?
    let teamSize: Int?
    let winner: Int?
    let teamCrowns: Int?
    let opponentCrowns: Int?
    let team: [Team]? = []
    let opponent: [Opponent]? = []
    let arena: Arena?
    
    init(json: JSON) {
        type = json["type"] as? String
        if let m = json["mode"] as? JSON {
            mode = Mode(json: m)
        } else {
            mode = nil
        }
        utcTime = json["utcTime"] as? Int
        deckType = json["deckType"] as? String
        teamSize = json["teamSize"] as? Int
        winner = json["winner"] as? Int
        teamCrowns = json["teamCrowns"] as? Int
        opponentCrowns = json["opponentCrowns"] as? Int
        if let t = json["team"] as? [JSON] {
            for te in t {
                team?.append(Team(json: te))
            }
        }
        if let o = json["opponent"] as? [JSON] {
            for op in o {
                opponent?.append(Opponent(json: op))
            }
        }
        if let a =  json["arena"] as? JSON {
            arena = Arena(json: a)
        } else {
            arena = nil
        }
    }
}
