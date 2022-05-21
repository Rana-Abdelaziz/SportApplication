//
//  FavoriteTableViewCell.swift
//  SportApplication
//
//  Created by Rana on 5/20/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImg: UIImageView!
     var youtubeLink:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func youtubeBtn(_ sender: Any) {
        let youtubeId = "SxTYjptEzZs"
             let youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
             
           if UIApplication.shared.canOpenURL(youtubeUrl as URL){
               UIApplication.shared.openURL(youtubeUrl as URL)
           } else{
           
             let myUrl = youtubeLink
             if((myUrl) != ""){
                 let youtubeUrl = NSURL(string:"https://"+myUrl)!
                 UIApplication.shared.openURL(youtubeUrl as URL)
             }

           }
    }
}
