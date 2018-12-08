//
//  ClanChest.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Tracking {
    let active: Int?
    let snapshotCount: Int?
    let available: Int?
    
    init(json: JSON) {
        active = json["active"] as? Int
        snapshotCount = json["snapshotCount"] as? Int
        available = json["available"] as? Int
    }
}
