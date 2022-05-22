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
        layout.itemSize = CGSize(width: 250, height: 250)
        
        collectionView.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: TeamsCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let team = teamsPresenter.getTeamAtIndex(index: indexPath.row)
        didSelectRow?(team)
        
    }
    
    // data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsPresenter.getTeamsCount()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.identifier, for: indexPath) as! TeamsCollectionViewCell
        
        teamsPresenter.configure(cell: cell, for: indexPath.row)
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        
        return cell
    }
    
}


extension TeamsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.height
        return CGSize(width: 250, height: 250)
        
    }
    
}
