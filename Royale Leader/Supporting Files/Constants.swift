//
//  Constants.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation
import Alamofire

var kBuildProduction: Int { get { return UserDefaultsHelper.getInt("buildProduction")! }
    set(value) { UserDefaultsHelper.saveInt(value, key: "buildProduction")}
}

var kChoosedServer: String { get {
    switch kBuildProduction {
    case 0:
        return Enviroment.production.rawValue
    default:
        return Enviroment.production.rawValue
    }
    }
}

var kDeveloperKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEwOSwiaWRlbiI6IjE0NDEwNDQzMjczMTI5MTY0OCIsIm1kIjp7fSwidHMiOjE1NDQxMjY2NDQ2MTV9.gWluTJ8c-opE1FEPb8V6KgyA4dPZDnTB4uguAdy60bs"

enum Enviroment: String {
    case production = "https://api.royaleapi.com"
}

typealias JSON = [String: AnyObject]
