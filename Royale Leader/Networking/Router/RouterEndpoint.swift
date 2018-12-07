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
    
    case library(edit: Int?)
    case comments(id: Int, start: Int?, limit: Int?)
    case makeComment(id: Int, comment: String)
    case preLogin(isPreLogin: Bool)
    case changeSettings()
    case recipients()
    case deviceToken(token: String)
    case removeDeviceToken(token: String)
    case edits()
    case polls(start: Int, limit: Int)
    case pollID(id: Int)
    case forgotPassword(user: String)
    case like(id: Int, module: String)
    case logout(token: String)
    case message(name: String?, email: String?, message: String, toID: Int?)
    case news(start: Int, limit: Int, edit: Int?)
    case newsID(id: Int)
    case newContents()
    case posts(start: Int, limit: Int)
    case editPost(id: Int, text: String?, files: [String]?)
    case deletePost(id: Int)
    case report(module: String, id: Int, action: Int)
    case answers(pollID: Int)
    case vote(answerID: Int)
    case videos(start: Int, limit: Int)
    case video(id: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .makeComment, .changeSettings, .deviceToken, .removeDeviceToken, .forgotPassword, .like,
             .logout, .message, .report, .vote:
            return .post
        case .editPost:
            return .put
        case .deletePost:
            return .delete
        default:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .library(_):
            return "/api/biblioteca"
        case .comments(_,_,_), .makeComment(_,_):
            return "/api/comentarios"
        case .preLogin(_), .changeSettings:
            return "/api/configuracoes"
        case .recipients():
            return "/api/destinatarios"
        case .deviceToken, .removeDeviceToken:
            return "/api/device"
        case .edits():
            return "/api/editorias"
        case .polls(_, _):
            return "/api/enquetes"
        case .pollID(let id):
            return "/api/enquetes/\(id)"
        case .forgotPassword(_):
            return "/api/usuarios/esqueci-senha"
        case .like(_,_):
            return "/api/likes"
        case .logout(_):
            return "/api/logout"
        case .message(_,_,_,_):
            return "/api/mensagens"
        case .news(_, _, _):
            return "/api/noticias"
        case .newsID(let id):
            return "/api/noticias/\(id)"
        case .newContents():
            return "/api/novidades"
        case .posts(_,_):
            return "/api/posts"
        case .deletePost(let id), .editPost(let id,_,_):
            return "/api/posts/\(id)"
        case .report(_,_,_):
            return "/api/relatorios"
        case .answers(_):
            return "/api/respostas"
        case .vote(_):
            return "/api/votos"
        case .videos(_,_):
            return "/api/videos"
        case .video(let id):
            return "/api/videos/\(id)"
        }
        
    }
    
    var header: HTTPHeaders {
        switch self {
        case .forgotPassword:
            return [HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue, HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue]
        default:
            let token = keychain[string: "token"]
            return [HTTPHeaderField.authentication.rawValue: token ?? "", HTTPHeaderField.contentType.rawValue: ContentType.application.rawValue]
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .library(let edit):
            var params = ["os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()] as [String: Any]
            if let editoria = edit {
                params.updateValue(editoria, forKey: "editorias_id")
            }
            return params
            
        case .comments(let id, let start, let limit):
            var params = ["id": id, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()] as [String : Any]
            if let st = start, let li = limit {
                params.updateValue(st, forKey: "start")
                params.updateValue(li, forKey: "limit")
            }
            return params
            
        case .makeComment(let id, let comment):
            return ["id": id, "comentario": comment, "package": DeviceHelper.bundleID(), "os": DeviceHelper.os(), "version": DeviceHelper.version()]
            
        case .preLogin(let isPreLogin):
            var params = ["package": DeviceHelper.bundleID(), "os": DeviceHelper.os(), "version": DeviceHelper.version()] as [String: Any]
            if isPreLogin {
                params.updateValue(isPreLogin, forKey: "pre-login")
            }
            return params
            
        case .changeSettings:
            return ["os": DeviceHelper.os(), "items": ["language": LanguageHelper.getLanguage(), "region": LanguageHelper.getDeviceRegion()]]
            
        case .recipients:
            return ["language": LanguageHelper.getLanguage(), "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .deviceToken(let token):
            return ["device": token, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .removeDeviceToken(let token):
            return ["device": token, "remover": true, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .edits:
            return ["language": LanguageHelper.getLanguage(), "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .polls(let start, let limit):
            return ["start": start, "limit": limit, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .pollID:
            return ["os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .forgotPassword(let user):
            return ["login": user, "package": DeviceHelper.bundleID(), "os": DeviceHelper.os(), "version": DeviceHelper.version()]
            
        case .like(let id, let module):
            return ["id": id, "modulo": module, "package": DeviceHelper.bundleID(), "os": DeviceHelper.os(), "version": DeviceHelper.version()]
            
            
        case .logout(let token):
            return ["device": token, "package": DeviceHelper.bundleID(), "os": DeviceHelper.os(), "version": DeviceHelper.version()]
            
        case .message(let name, let email, let message, let toID):
            var params = ["mensagem": message, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID(), "language": LanguageHelper.getLanguage()] as [String: Any]
            
            if let n = name {
                params.updateValue(n, forKey: "nome")
            }
            
            if let e = email {
                params.updateValue(e, forKey: "email")
            }
            
            if let to = toID {
                params.updateValue(to, forKey: "destinatarios_id")
            }
            
            return params
            
        case .news(let start, let limit, let edit):
            var params = ["start": start, "limit": limit, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()] as [String: Any]
            if let editoria = edit, editoria != 0{
                params.updateValue(editoria, forKey: "editorias_id")
            }
            return params
            
        case .newsID:
            return ["os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .newContents:
            let date = UserDefaultsHelper.getString("datahora")
            return ["datahora": date ?? "", "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .posts(let start, let limit):
            return ["start": start, "limit": limit, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .editPost(let id, let text, let files):
            var params = ["id": id, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()] as [String : Any]
            
            if let t = text {
                params.updateValue(t, forKey: "texto")
            }
            if let f = files {
                params.updateValue(f, forKey: "arquivos")
            }
            
            return params
            
        case .deletePost(let id):
            return ["id": id, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .report(let module, let id, let action):
            return ["modulo": module, "id": id, "acao": action, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .answers(let pollID):
            return ["enquetes_id": pollID, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
          case .vote(let answerID):
            return ["respostas_id": answerID, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .videos(let start, let limit):
            return ["start": start, "limit": limit, "os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
            
        case .video:
            return ["os": DeviceHelper.os(), "version": DeviceHelper.version(), "package": DeviceHelper.bundleID()]
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
