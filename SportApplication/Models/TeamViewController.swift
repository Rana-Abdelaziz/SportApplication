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
    @IBAction func instagramBtn(_ sender: Any) {
        
    }
    @IBAction func websiteBtn(_ sender: Any) {
        
    }
    @IBAction func twitterBtn(_ sender: Any) {
        
    }
    @IBAction func faceBookBtn(_ sender: Any) {
        
    }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
