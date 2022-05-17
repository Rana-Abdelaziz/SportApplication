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
    private let interactor = UpcomingEventsInteractor(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/")
    private var upcomingEvents = [UpcomingEvent]()
    
    init(view: UpcomingEventsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getUpcomingEvents()
    }
    
    func getUpcomingEvents(){
        view?.showIndicator()
        interactor.getUpcomingEvents(endPoint: "eventsseason.php?id=4617", completionHandler: { [weak self] upcomingEvents, error in

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

