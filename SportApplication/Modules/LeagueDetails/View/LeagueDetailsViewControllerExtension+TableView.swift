//
//  LeagueDetailsViewControllerExtension+TableView.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
        eventsTableView.register(UpcomingEventsTableViewCell.nib(), forCellReuseIdentifier: UpcomingEventsTableViewCell.identifier)
        eventsTableView.register(LatestResultsTableViewCell.nib(), forCellReuseIdentifier: LatestResultsTableViewCell.identifier)
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        3
//    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //switch
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let upcomingEventsCell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventsTableViewCell.identifier) as! UpcomingEventsTableViewCell
        
        let latestResultsCell = tableView.dequeueReusableCell(withIdentifier: LatestResultsTableViewCell.identifier) as! LatestResultsTableViewCell
        
        
        switch indexPath.row {
        case 0:
            return upcomingEventsCell
        case 1:
            return latestResultsCell
//        case 2:
//            return latestResultsCell
        default:
            return upcomingEventsCell
        }
        
    
//        return latestResultsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 250
        case 2:
            return 250
        default:
            return 250
        }
    }
    
}
