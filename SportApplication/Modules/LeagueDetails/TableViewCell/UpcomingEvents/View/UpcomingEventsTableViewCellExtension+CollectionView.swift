//
//  UpcomingEventsTableViewCellExtension+CollectionView.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit

extension UpcomingEventsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        
        let width = collectionView.frame.height
        layout.itemSize = CGSize(width: 350, height: 250)

        collectionView.register(UpcomingEventsCollectionViewCell.nib(), forCellWithReuseIdentifier: UpcomingEventsCollectionViewCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("collection cell tapped!")
        
    }
    
    // data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingEventsPresenter.getUpcomingEventsCount()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingEventsCollectionViewCell.identifier, for: indexPath) as! UpcomingEventsCollectionViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false

        upcomingEventsPresenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    
}

extension UpcomingEventsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.height
        return CGSize(width: 350, height: 250)
        
//        return CGSize(width: 100, height: 100)
        
    }
    
    
}
