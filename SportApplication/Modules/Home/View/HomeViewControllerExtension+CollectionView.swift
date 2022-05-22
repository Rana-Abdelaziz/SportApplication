//
//  HomeViewControllerExtension+CollectionView.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView(){
        
        if InternetConnectionManager.isConnectedToNetwork() {
            let layout = UICollectionViewFlowLayout()
            collectionView.collectionViewLayout = layout
            layout.itemSize = CGSize(width: (self.view.bounds.width - 48) / 2, height: (self.view.bounds.width + 20) / 2)
            
            collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
        } else {
            homePresenter.removeSports()
            collectionView.reloadData()
            let imageName = "noConnection.jpeg"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
            view.addSubview(imageView)
        }
        
    }
    
    // delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
        let leaguesViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesViewController
        
        let sportName = homePresenter.getSportNameAtIndex(index: indexPath.row)
        leaguesViewController.sportName = sportName
        
        print("collection cell tapped! \(sportName)")
        leaguesViewController.flag = "all"

        //leaguesViewController.flag = "favorite"
        self.navigationController?.pushViewController(leaguesViewController, animated: true)
    }
    
    // data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePresenter.getSportsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        homePresenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - 10) / 2
        return CGSize(width: width, height: width)
        
    }
    
}
