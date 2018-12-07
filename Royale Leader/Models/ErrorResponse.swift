//
//  ErrorResponse.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

struct ErrorResponse {
    let error: Bool?
    let status: Int?
    let message: String?
    
    init(json: JSON) {
        error = json["error"] as? Bool
        status = json["status"] as? Int
        message = json["message"] as? String
    }
}
