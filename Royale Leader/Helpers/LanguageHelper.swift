//
//  LanguageHelper.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation

class LanguageHelper: NSObject {
    
    static func getDeviceLanguage() -> String {
        
        var suportedLanguage = ""
        
        let languageCode = Locale.preferredLanguages
        
        for language in languageCode {
            if language.contains("pt") {
                suportedLanguage = "pt-BR"
                break
            }
            
            if language.contains("en") {
                suportedLanguage = "Base"
                break
            }
            
            if language.contains("es") {
                suportedLanguage = "es"
                break
            }
        }
        
        return suportedLanguage
    }
    
    
    static func getLanguage() -> String {
        
        var suportedLanguage = ""
        
        let languageCode = Locale.preferredLanguages
        
        for language in languageCode {
            if language.contains("pt") {
                suportedLanguage = "pt-br"
                break
            }
            
            if language.contains("en") {
                suportedLanguage = "en-us"
                break
            }
            
            if language.contains("es") {
                suportedLanguage = "es-es"
                break
            }
        }
        
        return suportedLanguage
    }
    
    static func getDeviceRegion() -> String {
        
        var region = ""
        
        let code = Locale.current
        
        region = code.localizedString(forRegionCode: code.regionCode!)!
        
        return region
    }
    
    static func changeLanguageDevice() {
        LocalizerChanger.DoTheSwizzling()
    }
}

class LocalizerChanger: NSObject {
    class func DoTheSwizzling() {
        MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector:
            #selector(Bundle.specialLocalizedString(key:value:table:)))
    }
}

extension Bundle {
    @objc func specialLocalizedString(key: String, value: String?, table tableName: String?) -> String {
        let currentLanguage = LanguageHelper.getDeviceLanguage()
        var bundle = Bundle();
        if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: _path)!
        } else {
            let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }
        return (bundle.specialLocalizedString(key: key, value: value, table: tableName))
    }
}

func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector){
    let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!;
    let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector)!;
    if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}
