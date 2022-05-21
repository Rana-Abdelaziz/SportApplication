//
//  FavoritesViewController+TableView.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = 85
        tableview.register(UINib(nibName: FavoritesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FavoritesTableViewCell.identifier)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesPresenter.getFavLeaguesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
        
        favoritesPresenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeagueDetailsViewController
        
        leagueDetailsViewController.leagueId = favoritesPresenter.getLeagueIdAtIndex(index: indexPath.row)
        leagueDetailsViewController.leagueName = favoritesPresenter.getLeagueNameAtIndex(index: indexPath.row)
        
        self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            favoritesPresenter.deleteLeagueAtIndex(indexPath.row)
            
            tableview.deleteRows(at: [indexPath], with: .fade)
            tableview.reloadData()
            
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        favoritesPresenter.didSelectRow(index: indexPath.row)
//    }
    
}
