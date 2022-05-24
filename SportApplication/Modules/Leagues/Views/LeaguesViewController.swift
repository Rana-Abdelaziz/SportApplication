//
//  LeaguesViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 14/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData
import Network


class LeaguesViewController: UIViewController , LeaguesTableViewProtocol{
  
  
  let indicator = UIActivityIndicatorView(style: .medium)
   var sportName="Soccer"
    var flag = "all"
    var leaguesList:[LeaguesModel] = []
    var leaguesPresenter:LeaguesProtocol?

    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        leaguesPresenter = LeaguesPresenter()
        let myUrl = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s="
        leaguesPresenter?.getLeagues(parameters: sportName, url: myUrl)
        //        leaguesPresenter?.getLeagues(sportName: sportName)
        indicator.startAnimating()
        let pre = LeaguesPresenter()
        pre.getLeaguess(parameters: sportName ,url: myUrl, completionHandler: { [weak self] leagues, error in
            print("Completion handler ")
            if let error = error {
                print(error)
            } else {
                guard let resualt = leagues else { return }
                self?.leaguesList = resualt.countries ?? []
                self!.tableView.reloadData()
                print(resualt)
                
            }
        })

    }
    
    func DispalyData(myLeagues: LeaguesResualt?, error: Error?) {
         print("inside DisplayData")
        indicator.stopAnimating()
         guard let leagues = myLeagues else {
             print(error)
             return
         }
         self.leaguesList = leagues.countries ?? []
        print(leaguesList[0].strLeague)
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        tableView.reloadData()
         print(leagues.countries![0].strLeague)

     }
    

//    func reloadTable(myLeagues: [LeaguesModel]){
////        leaguesList =
////        tableView.reloadData()
//        leaguesList = myLeagues
//        tableView.reloadData()
//    }
    

    

 
}


