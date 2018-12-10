//
//  ClanChest.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Tracking {
    let tag: String?
    let active: Bool?
    let available: Bool?
    let snapshotCount: Int?
    
    init(json: JSON) {
        tag = json["tag"] as? String
        active = json["active"] as? Bool
        available = json["available"] as? Bool
        snapshotCount = json["snapshotCount"] as? Int
    }
}
