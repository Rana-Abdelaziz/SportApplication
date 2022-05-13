//
//  HomeViewControllerExtension+PresenterDelegate.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

extension HomeViewController: HomeView {
    
    func showIndicator() {
        print("showIndicator")
    }
    
    func hideIndicator() {
        print("hideIndicator")
    }
    
    func fetchingDataSuccess() {
        print("fetchingDataSuccess")
        collectionView.reloadData()
    }
    
    func showError() {
        print("showError")
    }
    
}
