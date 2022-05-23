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
//    private let interactor = LatestResultsInteractor(baseUrl: Constants.BASE_URL)
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
//    
//    func viewDidLoad() {
//        getLatestResults()
//    }
    
//    func getLatestResults(leagueId: String) {
//
//        view?.showIndicator()
//        interactor.getLatestResults(endPoint: Constants.END_POINT_EVENTS + leagueId, completionHandler: { [weak self] latestResults, error in
//
//            guard let self = self else { return }
//            self.view?.hideIndicator()
//
//            if let error = error {
//                self.view?.showError()
//            } else {
//                guard let latestResults = latestResults else { return }
//                self.latestResults = latestResults.events
//                print("LatestEvents Completion handler success \(self.latestResults.count)")
//                self.view?.fetchingDataSuccess()
//            }
//        })
//    }
    
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
