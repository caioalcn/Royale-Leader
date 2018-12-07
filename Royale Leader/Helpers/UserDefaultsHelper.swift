//
//  UserDefaultsHelper.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    class func getString(_ key: String) -> String? {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: key) as? String
    }
    
    class func saveString(_ value: String?, key: String) {
        if let value = value {
            UserDefaults.standard.setValue(value, forKey: key)
        } else {
            UserDefaults.standard.setValue(nil, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func getInt(_ key: String) -> Int? {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: key)
    }
    
    class func saveInt(_ value: Int?, key: String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.setValue(nil, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func saveLanguage(_ value: JSON?, key: String) {
        if let value = value {
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: value), forKey: key)
        } else {
            UserDefaults.standard.setValue(nil, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func getBool(_ key: String) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
    class func saveBool(_ value: Bool?, key: String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.setValue(nil, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func getArray(_ key: String) -> [String] {
        let defaults = UserDefaults.standard
        return defaults.stringArray(forKey: key) ?? [String]()
    }
    
    class func saveArray(_ value: [String]?, key: String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.setValue(nil, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
}

