//
//  DeviceHelper.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class DeviceHelper {
    
    static let osSystemVersion = ProcessInfo().operatingSystemVersion
    
    class func os() -> String {
        return "iOS \(UIDevice.current.systemVersion)"
    }
    
    class func version() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class func bundleID() -> String {
        return Bundle.main.bundleIdentifier!
    }
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    class func remainingDiskSpaceOnThisDevice() -> String {
        let bundlePath = Bundle.main.bundlePath
        let bundleArray  = FileManager.default.subpaths(atPath: bundlePath)
        var fileSize : UInt64 = 0
        for file in bundleArray! {
            do {
                let attr = try FileManager.default.attributesOfItem(atPath: bundlePath + "/" + file )
                let xfileSize = attr[FileAttributeKey.size] as? UInt64 ?? 0
                fileSize =  fileSize + xfileSize
            } catch {
            }
        }
        let folderSize = ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .memory)
        return folderSize
    }
}
