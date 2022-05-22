//
//  FavoritesViewController+TableView.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit
import Toaster

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
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if InternetConnectionManager.isConnectedToNetwork() {
            let leagueDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeagueDetailsViewController
            
            leagueDetailsViewController.leagueId = favoritesPresenter.getLeagueIdAtIndex(index: indexPath.row)
            leagueDetailsViewController.leagueName = favoritesPresenter.getLeagueNameAtIndex(index: indexPath.row)
            
            self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)
        } else {
            showAlert()
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            favoritesPresenter.deleteLeagueAtIndex(indexPath.row)
            
            tableview.deleteRows(at: [indexPath], with: .fade)
            tableview.reloadData()
            
        }
    }
    
    func showAlert(){
        
        let alert : UIAlertController = UIAlertController(title: "Internet is not available", message: "You need to get internet connection before doing this operation!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert,animated: true,completion: nil)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        favoritesPresenter.didSelectRow(index: indexPath.row)
//    }
    
}
