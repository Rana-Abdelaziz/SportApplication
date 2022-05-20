//
//  FavoritesViewController+PresenterDelegate.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

extension FavoritesViewController {
    
    func showIndicator() {
        print("showIndicator")
    }
    
    func hideIndicator() {
        print("hideIndicator")
    }
    
    func fetchingDataSuccess() {
        print("fetchingDataSuccess")
        tableview.reloadData()
    }
    
    func showError() {
        print("showError")
    }
    
}
