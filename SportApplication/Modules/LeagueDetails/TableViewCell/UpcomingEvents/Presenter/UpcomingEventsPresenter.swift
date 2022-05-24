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
    
    func getUpcomingEventsCount() -> Int {
        return upcomingEvents.count
    }
    
    func configure(cell: UpcomingEventsCollectionViewCell, for index: Int) {
        let upcomingEvent = upcomingEvents[index]
        cell.displayEventImage(strSportThumb: upcomingEvent.strThumb ?? "")
        cell.displayEventDateAndTime(dateEventLocal: upcomingEvent.dateEventLocal ?? "", strTimeLocal: upcomingEvent.strTimeLocal ?? "")
    }
    
}

