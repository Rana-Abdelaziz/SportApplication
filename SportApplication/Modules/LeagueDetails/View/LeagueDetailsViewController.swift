//
//  LeagueDetailsViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import CoreData

class LeagueDetailsViewController: UIViewController {

    @IBOutlet weak var eventsTableView: UITableView!
    var leagueId: String?
    var leagueName: String?
    var leagueBadge: String?
    var leagueYoutubeLink: String?
    
    @IBOutlet weak var btnAddRemove: UIButton!
    
//    var coreData: CoreDataServices?
    let coreData = CoreDataServices.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
//        coreData = CoreDataServices()
        settingUpAddRemoveButton()
        
        print("selected leagueId \(leagueId)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
//        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func settingUpAddRemoveButton() {
        var isInFavs: Bool?
        isInFavs = coreData.checkIfLeagueInFavorites(leagueId: leagueId ?? "")
        print("is in Favs \(isInFavs)")
        
        if isInFavs ?? false {
            btnAddRemove.setTitle("Remove -", for: .normal)
        } else {
            btnAddRemove.setTitle("Add +", for: .normal)
        }
    }
    
    @IBAction func actionAddRemoveFav(_ sender: UIButton) {
        
        var isInFavs: Bool?
        isInFavs = coreData.checkIfLeagueInFavorites(leagueId: leagueId ?? "")
        print("is in Favs \(isInFavs)")
        
        if btnAddRemove.titleLabel?.text == "Add +" {
            
            btnAddRemove.setTitle("Remove -", for: .normal)
            
            coreData.addLeagueToFavorites(leagueId: leagueId ?? "", leagueName: leagueName ?? "", leagueBadge: leagueBadge ?? "", leagueYoutubeLink: leagueYoutubeLink ?? "")
            
        } else {
            btnAddRemove.setTitle("Add +", for: .normal)
            coreData.removeItemFromFavorites(leagueId: leagueId ?? "")
            print("league deleted!")
        }
        
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
