//
//  ClanWarLog.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 08/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct ClanWarLog {
   
    let log: [Log]? = []
    
    init(json: [JSON]) {
        for j in json {
            log?.append(Log(json: j))
        }
    }
}
