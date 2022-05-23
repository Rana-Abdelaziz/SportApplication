//
//  TeamViewController.swift
//  SportApplication
//
//  Created by Rana on 5/14/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    let presnter :TeamsPresnterProtocol = TeamPresenter()
    var team = TeamModel()
    
    
    @IBOutlet weak var teamTshirtImg: UIImageView!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    
 
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
                   self.teamName.text = self.team.strTeam
                   self.countryName.text = self.team.strCountry
                   self.stadiumName.text = self.team.strStadium
                   self.leagueName.text = self.team.strLeague
                   self.teamImg.layer.cornerRadius = self.teamImg.frame.size.width/2
                   self.teamImg.clipsToBounds = true
                   self.teamImg.kf.setImage(with: URL(string: self.team.strTeamBadge!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
                   
                   self.backgroundImg.kf.setImage(with: URL(string: self.team.strStadiumThumb ?? ""), placeholder: UIImage(named: "placeholder.jpeg"), options: nil, progressBlock: nil, completionHandler: nil)
                   self.teamTshirtImg.kf.setImage(with: URL(string: self.team.strTeamJersey ?? ""), placeholder: UIImage(named: "placeholder.jpeg"), options: nil, progressBlock: nil, completionHandler: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backAction(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
     }
     @IBAction func instagramBtn(_ sender: Any) {
        presnter.gotoInstgram(url: team.strInstagram!)
        
     }
     @IBAction func websiteBtn(_ sender: Any) {
        presnter.gotoWebSite(url:team.strWebsite!)
     }
     @IBAction func twitterBtn(_ sender: Any) {
        presnter.gotoTwiter(url:team.strTwitter!)
         
     }
     @IBAction func faceBookBtn(_ sender: Any) {
        presnter.gotoFaceBook(url: team.strFacebook!)
         
     }
    

    

}
