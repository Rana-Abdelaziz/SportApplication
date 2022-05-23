//
//  UpcomingEventsPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol UpcomingEventsView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol UpcomingEventsCellView {
    func displayImage(strSportThumb: String)
    func displayEventDateAndTime(dateEventLocal: String, strTimeLocal: String)
}

class UpcomingEventsPresenter {
    
    private weak var view: UpcomingEventsView?
//    private let interactor = UpcomingEventsInteractor(baseUrl: Constants.BASE_URL)
    let upcomingEventsAPI: UpcomingEventsAPIProtocol = UpcomingEventsAPI()
    private var upcomingEvents = [Event]()
    
    init(view: UpcomingEventsView) {
        self.view = view
    }
    
    func getUpcomingEvents(leagueId: String){
        view?.showIndicator()
        upcomingEventsAPI.getUpcomingEvents(leagueId: leagueId, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.upcomingEvents = response?.events ?? []
                self?.view?.hideIndicator()
                self?.view?.fetchingDataSuccess()
                
            case .failure(let error):
                // Show UI Error
                self?.view?.hideIndicator()
                self?.view?.showError()
            }
            
        })
    }
    
//    func getUpcomingEvents(leagueId: String){
//        view?.showIndicator()
//        interactor.getUpcomingEvents(endPoint: Constants.END_POINT_EVENTS + leagueId, completionHandler: { [weak self] upcomingEvents, error in
//
//            guard let self = self else { return }
//            self.view?.hideIndicator()
//
//            if let error = error {
//                self.view?.showError()
//            } else {
//                guard let upcomingEvents = upcomingEvents else { return }
//                self.upcomingEvents = upcomingEvents.events
//                print("UpcomingEvents Completion handler success \(self.upcomingEvents.count)")
//                self.view?.fetchingDataSuccess()
//            }
//        })
//    }
    
    func getUpcomingEventsCount() -> Int {
        return upcomingEvents.count
    }
    
    func configure(cell: UpcomingEventsCollectionViewCell, for index: Int) {
        let upcomingEvent = upcomingEvents[index]
        cell.displayEventImage(strSportThumb: upcomingEvent.strThumb ?? "")
        cell.displayEventDateAndTime(dateEventLocal: upcomingEvent.dateEventLocal ?? "", strTimeLocal: upcomingEvent.strTimeLocal ?? "")
    }
    
}

