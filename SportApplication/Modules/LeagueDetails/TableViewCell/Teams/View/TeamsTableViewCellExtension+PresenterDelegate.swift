//
//  TeamsTableViewCellExtension+PresenterDelegate.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

extension TeamsTableViewCell {
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
        print("Error while loading teams")
    }
}
