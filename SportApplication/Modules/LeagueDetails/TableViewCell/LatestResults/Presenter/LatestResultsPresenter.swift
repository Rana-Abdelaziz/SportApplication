//
//  LatestResultsPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol LatestResultsView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol LatestResultsCellView {
    func displayHomeTeam(strHomeTeam: String)
    func displayAwayTeam(strAwayTeam: String)
    func displayScore(intHomeScore: String, intAwayScore: String)
    func displayDateAndTime(dateEventLocal: String, strTimeLocal: String)
}


class LatestResultsPresenter {
    
    private weak var view: LatestResultsView?
    let latestResultsAPI: LatestEventsAPIProtocol = LatestEventsAPI()
    private var latestResults = [Event]()
    
    init(view: LatestResultsView) {
        self.view = view
    }
    
    func getLatestResults(leagueId: String){
        view?.showIndicator()
        latestResultsAPI.getLatestEvents(leagueId: leagueId, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.latestResults = response?.events ?? []
                self?.view?.hideIndicator()
                self?.view?.fetchingDataSuccess()
                
            case .failure(let error):
                // Show UI Error
                self?.view?.hideIndicator()
                self?.view?.showError()
            }
            
        })
    }
    
    func getLatestResultsCount() -> Int {
        return latestResults.count
    }
    
    func configure(cell: LatestResultsCollectionViewCell, for index: Int) {
        let latestResult = latestResults[index]
        cell.displayHomeTeam(strHomeTeam: latestResult.strHomeTeam ?? "")
        cell.displayAwayTeam(strAwayTeam: latestResult.strAwayTeam ?? "")
        cell.displayScore(intHomeScore: latestResult.intHomeScore ?? "", intAwayScore: latestResult.intAwayScore ?? "")
        cell.displayDateAndTime(dateEventLocal: latestResult.dateEventLocal ?? "", strTimeLocal: latestResult.strTimeLocal ?? "")
    }
    
}
