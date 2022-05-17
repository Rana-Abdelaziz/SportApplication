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
        presnter.getTeams(url: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League") { (TeamsResualt, Error) in
            guard let r = TeamsResualt else{
                print(Error ?? "Error fetching teams")
                return
            }
            self.team = r.teams![0]
            self.teamName.text = self.team.strTeam
            self.countryName.text = self.team.strCountry
            self.stadiumName.text = self.team.strStadium
            self.leagueName.text = self.team.strLeague
            self.teamImg.layer.cornerRadius = self.teamImg.frame.size.width/2
            self.teamImg.clipsToBounds = true
            self.teamImg.kf.setImage(with: URL(string: self.team.strTeamBadge!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
            
            self.backgroundImg.kf.setImage(with: URL(string: self.team.strStadiumThumb!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
            self.teamTshirtImg.kf.setImage(with: URL(string: self.team.strTeamJersey!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
            print(r.teams)
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }
     @IBAction func instagramBtn(_ sender: Any) {
         let instagramUrl = NSURL(string:"https://"+team.strInstagram!+"/")
                 if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
                     UIApplication.shared.openURL(instagramUrl! as URL)
                 } else {
                     UIApplication.shared.openURL(NSURL(string: "https://www.instagram.com/"
         )! as URL)
                 }
     }
     @IBAction func websiteBtn(_ sender: Any) {
         let websiteUrl = NSURL(string: "http://"+team.strWebsite!)
             
             if UIApplication.shared.canOpenURL(websiteUrl! as URL) {
                 UIApplication.shared.openURL(websiteUrl! as URL)
             } else {
                 UIApplication.shared.openURL(NSURL(string: "http://google.com/")! as URL)
             }
         
     }
     @IBAction func twitterBtn(_ sender: Any) {
         let twitterUrl = NSURL(string: "https://"+team.strTwitter!)
         if UIApplication.shared.canOpenURL(twitterUrl! as URL) {
             UIApplication.shared.openURL(twitterUrl! as URL)
         } else {
             UIApplication.shared.openURL(NSURL(string: "https://twitter.com/")! as URL)
         }
         
     }
     @IBAction func faceBookBtn(_ sender: Any) {
         let facebookUrl = NSURL(string: "https://"+team.strFacebook!)
         if UIApplication.shared.canOpenURL(facebookUrl! as URL) {
             UIApplication.shared.openURL(facebookUrl! as URL)
         } else {
             UIApplication.shared.openURL(NSURL(string: "http://facebook.com/")! as URL)
         }
         
     }
    

    

}
