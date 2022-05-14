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
    
    @IBOutlet weak var myLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presnter.getTeams(url: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League") { (TeamsResualt, Error) in
            guard let r = TeamsResualt else{
                print(Error)
                self.myLable.text = Error as! String
                return
            }
            self.myLable.text = r.teams![0].strDescriptionEN
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
