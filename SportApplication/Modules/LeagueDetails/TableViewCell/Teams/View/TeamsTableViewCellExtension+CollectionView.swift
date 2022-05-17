//
//  TeamsTableViewCellExtension+CollectionView.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit

extension TeamsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        
        let width = collectionView.frame.height
        layout.itemSize = CGSize(width: 350, height: 250)
        
        collectionView.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: TeamsCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    // delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("team tapped!")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let teamDetailsVC = storyboard.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController

        let team = teamsPresenter.getTeamAtIndex(index: indexPath.row)
        teamDetailsVC.team = team
        print("team selected \(team.strTeam)")
//        self.present
        let navigationController = UINavigationController(nibName: "mainNavController", bundle: nil)
        navigationController.pushViewController(teamDetailsVC, animated: true)
//        self.navigation
        
//        let leaguesViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesViewController
//
//        let sportName = homePresenter.getSportNameAtIndex(index: indexPath.row)
//        leaguesViewController.sportName = sportName
//
//        print("collection cell tapped! \(sportName)")
//        leaguesViewController.flag = "all"
//        self.navigationController?.pushViewController(leaguesViewController, animated: true)
        
    }
    
    // data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsPresenter.getTeamsCount()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.identifier, for: indexPath) as! TeamsCollectionViewCell
        
        teamsPresenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    
}


extension TeamsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.height
        return CGSize(width: 350, height: 250)
        
    }
    
}
