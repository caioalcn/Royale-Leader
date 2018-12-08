//
//  Member.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Member {
    let name: String?
    let tag: String?
    let rank: Int?
    let previousRank: Int?
    let role: String?
    let expLevel: Int?
    let trophies: Int?
    let donations: Int?
    let donationsReceived: Int?
    let donationsDelta: Int?
    let donationsPercent: Double?
    let arena: Arena?
    
    init(json: JSON) {
        name = json["name"] as? String
        tag = json["tag"] as? String
        rank = json["rank"] as? Int
        previousRank = json["previousRank"] as? Int
        role = json["role"] as? String
        expLevel = json["expLevel"] as? Int
        trophies = json["trophies"] as? Int
        donations = json["donations"] as? Int
        donationsReceived = json["donationsReceived"] as? Int
        donationsDelta = json["donationsDelta"] as? Int
        donationsPercent = json["donationsPercent"] as? Double
        if let a =  json["arena"] as? JSON {
            arena = Arena(json: a)
        } else {
            arena = nil
        }
    }
}
