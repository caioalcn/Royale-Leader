//
//  APIClans.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 07/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation
import Alamofire

class APIClans {
    static func clan(tag: String, completion:@escaping (ErrorResponse?, Clan?, Result<Any>) -> Void) {
        Client.performRequest(route: .clan(tag: tag)) { (result) in
            guard let json = result.value as? JSON else { completion(nil, nil, result)
                return }
            
            let response = ErrorResponse(json: json)
            
            let clan = Clan(json: json)
                
            completion(response, clan, result)
        
        }
    }
    
    static func clanBattles(tag: String, completion:@escaping (ErrorResponse?, ClanBattles?, Result<Any>) -> Void) {
        Client.performRequest(route: .clanBattles(tag: tag)) { (result) in
           
            guard let json = result.value as? [JSON] else {
                if let j = result.value as? JSON {
                    let response = ErrorResponse(json: j)

                    completion(response, nil, result)
                } else {
                    completion(nil, nil, result)
                }
                return }
            
            let clanBattles = ClanBattles(json: json)
            
            completion(nil, clanBattles, result)
        }
    }
}
