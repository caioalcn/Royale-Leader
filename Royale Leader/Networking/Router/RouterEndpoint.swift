//
//  RouterEndpoint.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 05/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation
import Alamofire
import KeychainAccess

let keychain = Keychain(service: DeviceHelper.bundleID())

enum RouterEndpoint: APIConfiguration {
    
    case clan(tag: String)
    case clanBattles(tag: String)
    case clanWar(tag: String)
    case clanWarLog(tag: String)
    case clanHistory(tag: String)
    case clanWeeklyHistory(tag: String)
    case clanTracking(tag: String)
    

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        
        default:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .clan(let tag):
            return "/clan/\(tag)"
        case .clanBattles(let tag):
            return "/clan/\(tag)/battles"
        case .clanWar(let tag):
            return "/clan/\(tag)/war"
        case .clanWarLog(let tag):
            return "/clan/\(tag)/warlog"
        case .clanHistory(let tag):
            return "/clan/\(tag)/history"
        case .clanWeeklyHistory(let tag):
            return "/clan/\(tag)/history/weekly"
        case .clanTracking(let tag):
            return "/clan/\(tag)/tracking"
        }
        
    }
    
    var header: HTTPHeaders {
        switch self {
         default:
            return [HTTPHeaderField.authentication.rawValue: String(format: "Bearer \(kDeveloperKey)"), HTTPHeaderField.contentType.rawValue: ContentType.application.rawValue]
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .clan(let tag):
            let params = ["tag": tag] as [String: Any]
           
            return params
            
        case .clanBattles(_):
            let params = ["type": "clanMate"] as [String: Any]
            
            return params
    
        case .clanWar(let tag):
            let params = ["tag": tag] as [String: Any]
            
            return params
            
        case .clanWarLog(let tag):
            let params = ["tag": tag] as [String: Any]
            
            return params
        
        case .clanHistory(let tag):
            let params = ["tag": tag] as [String: Any]
            
            return params
        
        case .clanTracking(let tag):
            let params = ["tag": tag] as [String: Any]
            
            return params
            
        case .clanWeeklyHistory(let tag):
            let params = ["tag": tag] as [String: Any]
            
            return params
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try kChoosedServer.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        print(urlRequest.url ?? "null request")
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.allHTTPHeaderFields = header
        
        // Parameters
        let param = parameters
        let encod = encoding
        
        return try encod.encode(urlRequest, with: param)
    }
}
