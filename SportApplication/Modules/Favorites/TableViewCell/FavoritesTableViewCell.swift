//
//  FavoritesTableViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher
import Toaster

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var youtubeBtn: UIImageView!
    var youtubeLink: String = ""
    
//    var showAlert: (() -> Void)? = nil
    
//    var favoritesPresenter: FavoritesPresenter!
    
    static let identifier = "FavoritesTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        favoritesPresenter = FavoritesPresenter(view: self)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        youtubeBtn.isUserInteractionEnabled = true
        youtubeBtn.addGestureRecognizer(tapGestureRecognizer)
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
    func getYoutubeLink(youtubeLink: String) {
        self.youtubeLink = youtubeLink
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if InternetConnectionManager.isConnectedToNetwork() {
            goToYoutube(youtubeLink: youtubeLink)
        } else {
            Toast(text: "You need to get internet connection before doing this operation!").show()
        }
        
        
//        let youtubeId = "SxTYjptEzZs"
//          let youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
//
//        if UIApplication.shared.canOpenURL(youtubeUrl as URL){
//            UIApplication.shared.openURL(youtubeUrl as URL)
//        } else{
//
//          let myUrl = youtubeLink
//          if((myUrl) != ""){
//              let youtubeUrl = NSURL(string:"https://"+myUrl)!
//              UIApplication.shared.openURL(youtubeUrl as URL)
//          }
  //        else{
  //            controller.showAlert()
  //        }
  //
//        }
//        let youtubeLink = favoritesPresenter.
    }
    
    func goToYoutube(youtubeLink: String?) {

        let appName = "youtube"
        let appScheme = "\(appName)://app"
        let appUrl = URL(string: appScheme)

        if UIApplication.shared.canOpenURL(appUrl! as URL) {
            UIApplication.shared.open(appUrl!)
        } else {
            UIApplication.shared.open(URL(string: ("https://\(youtubeLink ?? "")"))!, options: [:], completionHandler: nil)
        }

    }
    
//    func showAlert(){
//        
//        let alert : UIAlertController = UIAlertController(title: "Internet is not available", message: "You need to get internet connection before doing this operation!", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        
//        present(alert,animated: true,completion: nil)
//    }
    
}
