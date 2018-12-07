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
    case 1:
        return Enviroment.development.rawValue
    case 2:
        return Enviroment.staging.rawValue
    case 3:
        return kOtherEndPoint
    default:
        return Enviroment.development.rawValue
    }
    }
}

var kOtherEndPoint: String { get { return UserDefaultsHelper.getString("otherEndPoint")! }
    set(value) { UserDefaultsHelper.saveString(value, key: "otherEndPoint")}
}


var kDeveloperKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEwOSwiaWRlbiI6IjE0NDEwNDQzMjczMTI5MTY0OCIsIm1kIjp7fSwidHMiOjE1NDQxMjY2NDQ2MTV9.gWluTJ8c-opE1FEPb8V6KgyA4dPZDnTB4uguAdy60bs"

enum Enviroment: String {
    case development = "http://testes.screencorp.com.br"
    case staging = "http://mobile.screencorp.com.br"
    case production = "https://screencorp.com.br"
}

typealias JSON = [String: AnyObject]
