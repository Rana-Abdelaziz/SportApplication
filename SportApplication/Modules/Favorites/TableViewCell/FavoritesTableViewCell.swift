//
//  FavoritesTableViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var youtubeBtn: UIImageView!
    
    static let identifier = "FavoritesTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // set event image
    func displayLeagueImage(leagueImage: String) {
        self.leagueImage.kf.setImage(with: URL(string: leagueImage), placeholder: UIImage(named: "placeholder.jpeg"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    // set event image
    func displayLeagueName(leagueName: String) {
        self.leagueName.text = leagueName
    }
    
}
