//
//  TeamsPresetnerProtocols.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol TeamsView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol TeamsCellView {
    func displayTeamImage(strTeamBadge: String)
    func displayTeamName(strTeam: String)
}
