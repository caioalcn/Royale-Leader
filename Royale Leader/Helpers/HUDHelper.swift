//
//  HUDHelper.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 06/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import Foundation
import KRProgressHUD

class HUDHelper {
    class func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        KRProgressHUD.show()
    }
    
    class func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        KRProgressHUD.dismiss()
    }
    
    class func hideLoadingWithSuccess() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        KRProgressHUD.showSuccess()
    }
    
    class func hideLoadingWithError() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        KRProgressHUD.showError()
    }
}
