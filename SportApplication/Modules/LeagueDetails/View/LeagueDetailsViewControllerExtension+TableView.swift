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
        
        eventsTableView.register(TeamsTableViewCell.nib(), forCellReuseIdentifier: TeamsTableViewCell.identifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let upcomingEventsCell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventsTableViewCell.identifier) as! UpcomingEventsTableViewCell
        
        let latestResultsCell = tableView.dequeueReusableCell(withIdentifier: LatestResultsTableViewCell.identifier) as! LatestResultsTableViewCell
        
        let teamsCell = tableView.dequeueReusableCell(withIdentifier: TeamsTableViewCell.identifier) as! TeamsTableViewCell
        
        
//        upcomingEventsCell.setLeagueId(leagueId: "4617")
//        latestResultsCell.setLeagueId(leagueId: "4617")
//        teamsCell.setLeagueName(leagueName: "Albanian%20Superliga")
        
        upcomingEventsCell.setLeagueId(leagueId: leagueId ?? "")
        latestResultsCell.setLeagueId(leagueId: leagueId ?? "")
        let leagueNameWithPercentEncoding = leagueName?.replacingOccurrences(of: " ", with: "%20")
        teamsCell.setLeagueName(leagueName: leagueNameWithPercentEncoding ?? "")
        
//        latestResultsCell.layer.shadowColor = UIColor.black.cgColor
//        latestResultsCell.layer.shadowOffset = CGSize(width: 3, height: 3)
//        latestResultsCell.layer.shadowRadius = 4
//        latestResultsCell.layer.shadowOpacity = 0.3
//        latestResultsCell.layer.masksToBounds = false
//        
//        upcomingEventsCell.layer.shadowColor = UIColor.black.cgColor
//        upcomingEventsCell.layer.shadowOffset = CGSize(width: 3, height: 3)
//        upcomingEventsCell.layer.shadowRadius = 4
//        upcomingEventsCell.layer.shadowOpacity = 0.3
//        upcomingEventsCell.layer.masksToBounds = false
//        
//        teamsCell.layer.shadowColor = UIColor.black.cgColor
//        teamsCell.layer.shadowOffset = CGSize(width: 3, height: 3)
//        teamsCell.layer.shadowRadius = 4
//        teamsCell.layer.shadowOpacity = 0.3
//        teamsCell.layer.masksToBounds = false
        
        teamsCell.didSelectRow = { [weak self] team in
            
            let teamDetailsVC = self?.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamViewController
            teamDetailsVC.team = team
            self?.navigationController?.present(teamDetailsVC, animated: true)
            
        }
        
        switch indexPath.row {
        case 0:
            return upcomingEventsCell
        case 1:
            return latestResultsCell
        case 2:
            return teamsCell
        default:
            return upcomingEventsCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 500
        case 2:
            return 200
        default:
            return 250
        }
    }
    
}
