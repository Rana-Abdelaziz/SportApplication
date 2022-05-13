//
//  LeaguesTableViewCell.swift
//  SportApplication
//
//  Created by Rana on 5/13/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var youtubeImage: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    var youtubeLink:String = ""
    @IBAction func goToYoutube(_ sender: Any) {
      let youtubeId = "SxTYjptEzZs"
      var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        
      if UIApplication.shared.canOpenURL(youtubeUrl as URL){
          UIApplication.shared.openURL(youtubeUrl as URL)
      } else{
      
        let myUrl = youtubeLink
        if((myUrl) != ""){
            //  myUrl="https://www.youtube.com/watch?v=pt26kmLhafc"
            let youtubeUrl = NSURL(string:"https://"+myUrl)!
            UIApplication.shared.openURL(youtubeUrl as URL)
        }
         
      }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
