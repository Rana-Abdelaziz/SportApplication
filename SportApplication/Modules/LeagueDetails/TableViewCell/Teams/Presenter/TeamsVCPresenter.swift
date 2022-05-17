//
//  TeamsPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

class TeamsVCPresenter {
    
    private weak var view: TeamsView?
    private let interactor = TeamsInteractor(baseUrl: Constants.BASE_URL)
    private var teamsResult = [TeamModel]()
    
    init(view: TeamsView) {
        self.view = view
    }
    
//    func viewDidLoad() {
//        getTeamsResult()
//    }
    
    func getTeamsResult(leagueName: String){
        view?.showIndicator()
        interactor.getTeamsResult(endPoint: Constants.END_POINT_TEAMS + leagueName, completionHandler: { [weak self] teamsResult, error in

            guard let self = self else { return }
            self.view?.hideIndicator()

            if let error = error {
                self.view?.showError()
            } else {
                guard let teamsResult = teamsResult else { return }
                self.teamsResult = teamsResult.teams ?? []
                print("TeamsResult Completion handler success \(self.teamsResult.count)")
                self.view?.fetchingDataSuccess()
            }
        })
    }
    
    func getTeamsCount() -> Int {
        return teamsResult.count
    }
    
    func configure(cell: TeamsCollectionViewCell, for index: Int) {
        let teamsResult = teamsResult[index]
        cell.displayTeamName(strTeam: teamsResult.strTeam ?? "")
        cell.displayTeamImage(strTeamBadge: teamsResult.strTeamBadge ?? "")
    }
    
    func getTeamAtIndex(index: Int) -> TeamModel {
        return teamsResult[index]
    }
    
}
