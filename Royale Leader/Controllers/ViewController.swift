//
//  ViewController.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 05/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        APIClans.clan(tag: "#PCGPJCJR") { (response, result, status) in
            switch status {
            case .success( _):
                print("success \(result)")
            case .failure(let error):
                print(error)
            }
        }
    }


}

