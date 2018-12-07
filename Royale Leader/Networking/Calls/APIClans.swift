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
        Client.performRequest(route: RouterEndpoint.clan(tag: tag)) { (result) in
            guard let json = result.value as? JSON else { completion(nil, nil, result)
                return }
            
            let response = ErrorResponse(json: json)
            
            let clan = Clan(json: json)
                
            completion(response, clan, result)
        
        }
    }
}
