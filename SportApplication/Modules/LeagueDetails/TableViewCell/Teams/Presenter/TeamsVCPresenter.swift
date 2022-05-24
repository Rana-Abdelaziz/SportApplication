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
    let leagueTeamsAPI: LeagueTeamsAPIProtocol = LeagueTeamsAPI()
    private var teamsResult = [TeamModel]()
    
    init(view: TeamsView) {
        self.view = view
    }
    
//    func getTeamsResult(leagueName: String){
//        view?.showIndicator()
//        leagueTeamsAPI.getLeagueTeams(leagueName: leagueName, completion: { [weak self] (result) in
//            switch result {
//            case .success(let response):
//                print("teams response \(response?.teams)")
//                self?.teamsResult = response?.teams ?? []
//                self?.view?.hideIndicator()
//                self?.view?.fetchingDataSuccess()
//
//            case .failure(let error):
//                // Show UI Error
//                self?.view?.hideIndicator()
//                self?.view?.showError()
//            }
//
//        })
//    }
    
    func getTeamsResult(leagueName: String){
        view?.showIndicator()
        interactor.getTeamsResult(endPoint: Constants.END_POINT_TEAMS2 + leagueName, completionHandler: { [weak self] teamsResult, error in

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
    
    func getTeamAtIndex(index: Int) -> TeamModel {
        return teamsResult[index]
    }
    
    func configure(cell: TeamsCollectionViewCell, for index: Int) {
        let team = teamsResult[index]
        cell.displayTeamName(strTeam: team.strTeam ?? "")
        cell.displayTeamImage(strTeamBadge: team.strTeamBadge ?? "")
    }
    
}
