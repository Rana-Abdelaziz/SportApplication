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
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        setupTableView()
        
        // link with btn or image instead
        let league = League(context: context)
        
        league.leagueId = leagueId ?? ""
        league.leagueName = leagueName ?? ""
        league.leagueBadge = leagueBadge ?? ""
        league.leagueYoutubeLink = leagueYoutubeLink ?? ""
        
        do {
            try self.context.save()
            print("league saved with name: \(leagueName ?? "")") // change button or image to remove
        } catch {
            // show ui error
            print("Error adding to favorites")
        }
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
    }
    
    @IBAction func actionAddRemoveFav(_ sender: UIButton) {
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
