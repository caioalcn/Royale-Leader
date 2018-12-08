//
//  Location.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct Location {
    let name: String?
    let isCountry: Bool?
    let code: String?
    
    init(json: JSON) {
        name = json["name"] as? String
        isCountry = json["isCountry"] as? Bool
        code = json["code"] as? String
    }
}
