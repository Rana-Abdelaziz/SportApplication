//
//  LeaguesViewController.swift
//  SportApplication
//
//  Created by Rana on 5/13/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
   
    var leaguesList:[LeaguesModel] = []
    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register()
        super.viewDidLoad()
        
        let network = LeaguesNetworkManager(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Soccer")
                 network.getLeagues(completionHandler: { [weak self] leagues, error in
                     print("Completion handler ")
                     if let error = error {
                         print(error)
                     } else {
                         guard let resualt = leagues else { return }
                         self?.leaguesList = resualt.countries ?? []
                         print(resualt)
                         
                        
                     }
                 })

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesList.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          <#code#>
      }
      
    

 
}
