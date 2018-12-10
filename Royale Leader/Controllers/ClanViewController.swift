    //
//  ClanViewController.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 09/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import UIKit
import SDWebImage

class ClanViewController: UIViewController {

    @IBOutlet weak var clanLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var clanImage: UIImageView!
    @IBOutlet weak var trophiesLabel: UILabel!
    @IBOutlet weak var requiredTroLabel: UILabel!
    @IBOutlet weak var clanTroLabel: UILabel!
    @IBOutlet weak var donationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var members: [Member]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        HUDHelper.showLoading()
        
        APIClans.clan(tag: "#PCGPJCJR") { (response, result, status) in
            switch status {
            case .success( _):
                self.clanLabel.text = result?.name
                self.descriptionLabel.text = result?.description
                self.clanImage.sd_setImage(with: URL(string: result?.badge?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                self.trophiesLabel.text = String(describing: result?.score ?? 0)
                self.requiredTroLabel.text = String(describing: result?.requiredScore ?? 0)
                self.donationLabel.text = String(describing: result?.donations ?? 0)
                
                self.members = result?.members?.sorted(by: { $0.donations! > $1.donations! })
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
//        APIClans.clanBattles(tag: "#PCGPJCJR") { (response, result, status) in
//            switch status {
//            case .success( _):
//                print("success \(result)")
//
//                var a = result?.battles?[0].team?[0].deck?[0].key
//
//                self.image.sd_setImage(with: URL(string: kAssetsURL+"/cards/"+a!+".png"), placeholderImage: UIImage(named: "placeholder.png"))
//
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        //
        APIClans.clanWar(tag: "#PCGPJCJR") { (response, result, status) in
            switch status {
            case .success(_):
                self.clanTroLabel.text = String(describing: result?.clan?.warTrophies ?? 0)
                HUDHelper.hideLoading()

            case .failure(let error):
                print(error)
            }
        }
        //
        //        APIClans.clanWarLog(tag: "#PCGPJCJR") { (response, result, status) in
        //            switch status {
        //            case .success(_):
        //                print("success \(result)")
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        //
        //        APIClans.clanTracking(tag: "#PCGPJCJR") { (response, result, status) in
        //            switch status {
        //            case .success(_):
        //                print("success \(result)")
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }    }


    }
    
}

extension ClanViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members?.count ?? 0
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "participantsCell", for: indexPath) as! ParticipantsCell
        
        cell.setupCell(member: members?[indexPath.row] ?? nil)
        
        return cell
    }
}
