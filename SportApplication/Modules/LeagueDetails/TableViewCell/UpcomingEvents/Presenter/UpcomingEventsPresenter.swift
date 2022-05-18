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
}

class UpcomingEventsPresenter {
    
    private weak var view: UpcomingEventsView?
    private let interactor = UpcomingEventsInteractor(baseUrl: Constants.BASE_URL)
    private var upcomingEvents = [UpcomingEvent]()
    
    init(view: UpcomingEventsView) {
        self.view = view
    }
    
//    func viewDidLoad(leagueId: String?) {
////        guard let league = leagueId else {
////            return
////        }
//        print("presenter leauge \(leagueId)")
//        getUpcomingEvents(leagueId: leagueId)
//    }
    
    func getUpcomingEvents(leagueId: String){
        view?.showIndicator()
        interactor.getUpcomingEvents(endPoint: Constants.END_POINT_EVENTS + leagueId, completionHandler: { [weak self] upcomingEvents, error in

            guard let self = self else { return }
            self.view?.hideIndicator()

            if let error = error {
                self.view?.showError()
            } else {
                guard let upcomingEvents = upcomingEvents else { return }
                self.upcomingEvents = upcomingEvents.events
                print("UpcomingEvents Completion handler success \(self.upcomingEvents.count)")
                self.view?.fetchingDataSuccess()
            }
        })
    }
    
    func getUpcomingEventsCount() -> Int {
        return upcomingEvents.count
    }
    
    func configure(cell: UpcomingEventsCollectionViewCell, for index: Int) {
        let upcomingEvent = upcomingEvents[index]
        cell.displayEventImage(strSportThumb: upcomingEvent.strThumb ?? "")
    }
    
}
