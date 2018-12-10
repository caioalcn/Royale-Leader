//
//  ParticipantsCell.swift
//  Royale Leader
//
//  Created by Caio Alcântara on 09/12/18.
//  Copyright © 2018 Red Ice. All rights reserved.
//

import UIKit

class ParticipantsCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var trophiesLabel: UILabel!
    @IBOutlet weak var donationLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        rankLabel.text = ""
        nameLabel.text = ""
        levelLabel.text = ""
        trophiesLabel.text = ""
        donationLabel.text = ""
        roleLabel.text = ""
        
        leagueImage.image = UIImage(named: "league-0")
    }
    
    func setupCell(member: Member?) {
        
        rankLabel.text = String(describing: member?.rank ?? 0)
        nameLabel.text = member?.name
        levelLabel.text = String(describing: member?.expLevel ?? 0)
        trophiesLabel.text = String(describing: member?.trophies ?? 0)
        donationLabel.text = String(describing: member?.donations ?? 0)
        roleLabel.text = member?.role
        
        if member?.role == "leader" {
            roleLabel.textColor = UIColor.red
        } else if member?.role == "coLeader"{
            roleLabel.textColor = UIColor.orange
        } else if member?.role == "elder"{
            roleLabel.textColor = UIColor.cyan
        } else {
            roleLabel.textColor = UIColor.black
        }
        
        
        switch member?.arena?.arenaID {
        case 0:
            leagueImage.image = UIImage(named: "arena0")
        case 1:
            leagueImage.image = UIImage(named: "arena1")
        case 2:
            leagueImage.image = UIImage(named: "arena2")
        case 3:
            leagueImage.image = UIImage(named: "arena3")
        case 4:
            leagueImage.image = UIImage(named: "arena4")
        case 5:
            leagueImage.image = UIImage(named: "arena5")
        case 6:
            leagueImage.image = UIImage(named: "arena6")
        case 7:
            leagueImage.image = UIImage(named: "arena7")
        case 8:
            leagueImage.image = UIImage(named: "arena8")
        case 9:
            leagueImage.image = UIImage(named: "arena9")
        case 10:
            leagueImage.image = UIImage(named: "arena10")
        case 11:
            leagueImage.image = UIImage(named: "arena11")
        case 12:
            leagueImage.image = UIImage(named: "arena12")
        case 13:
            leagueImage.image = UIImage(named: "arena13")
        case 14:
            leagueImage.image = UIImage(named: "arena14")
        case 15:
            leagueImage.image = UIImage(named: "arena15")
        case 16:
            leagueImage.image = UIImage(named: "arena16")
        case 17:
            leagueImage.image = UIImage(named: "arena17")
        case 18:
            leagueImage.image = UIImage(named: "arena18")
        case 19:
            leagueImage.image = UIImage(named: "arena19")
        case 20:
            leagueImage.image = UIImage(named: "arena20")
        case 21:
            leagueImage.image = UIImage(named: "arena21")
        default:
            leagueImage.image = UIImage(named: "league-0")

        }
        
    }

}
