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
}

//protocol LatestResultsCellView {
//    func displayName(strHomeTeam: String)
////    func displayAwayTeam(strAwayTeam: String)
//}

//protocol LatestResultsCellView {
//    func displayImage(strThumb: String)
//}

class LatestResultsPresenter {
    
    private weak var view: LatestResultsView?
    private let interactor = LatestResultsInteractor(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/")
    private var latestResults = [LatestEvent]()
    
    init(view: LatestResultsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getLatestResults()
    }
    
    func getLatestResults(){
        view?.showIndicator()
        interactor.getLatestResults(endPoint: "eventsseason.php?id=4617", completionHandler: { [weak self] latestResults, error in

            guard let self = self else { return }
            self.view?.hideIndicator()

            if let error = error {
                self.view?.showError()
            } else {
                guard let latestResults = latestResults else { return }
                self.latestResults = latestResults.events
                print("LatestEvents Completion handler success \(self.latestResults.count)")
                self.view?.fetchingDataSuccess()
            }
        })
    }
    
    func getLatestResultsCount() -> Int {
        return latestResults.count
    }
    
//    func configure(cell: LatestResultCollectionViewCell, for index: Int) {
//        let latestResult = latestResults[index]
//        cell.displayEventImage(strSportThumb: latestResult.strThumb ?? "")
//    }
    
    func configure(cell: LatestResultsCollectionViewCell, for index: Int) {
        let latestResult = latestResults[index]
        cell.displayHomeTeam(strHomeTeam: latestResult.strHomeTeam ?? "")
        cell.displayAwayTeam(strAwayTeam: latestResult.strAwayTeam ?? "")
    }
    
}
