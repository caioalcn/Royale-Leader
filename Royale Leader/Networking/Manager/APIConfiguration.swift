//
//  APIConfiguration.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var header: HTTPHeaders { get }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
    case application = "application/x-www-form-urlencoded"
}
