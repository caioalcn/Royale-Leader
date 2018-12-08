//
//  ClanBattles.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct ClanBattles {
    
    let battles: [Battle]? = []
   
    init(json: [JSON]) {
        for j in json {
            battles?.append(Battle(json: j))
        }
    }
   
}
