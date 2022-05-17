////
////  LeagueDetailsPresenter.swift
////  SportApplication
////
////  Created by Abdelrhman Ahmed on 17/05/2022.
////  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
////
//
//import Foundation
//
//class LeagueDetailsPresenter {
//    
//    private weak var view: LatestResultsView?
//    private let eventNetworkManager = EventsNetworkManager()
//    private var events = [Event]()
//    
//    
//    func viewDidLoad(leagueId: String?) {
//        getEvents(leagueId: leagueId)
//    }
//    
//    func getEvents(leagueId: String?){
//        view?.showIndicator()
//        eventNetworkManager.getEvents(endPoint: Constants.END_POINT_EVENTS + (leagueId ?? ""), completionHandler: { [weak self] events, error in
//
//            guard let self = self else { return }
//            self.view?.hideIndicator()
//
//            if let error = error {
//                self.view?.showError()
//            } else {
//                guard let events = events else { return }
//                self.events = events.events
//                print("Events Completion handler success \(self.events.count)")
//                self.view?.fetchingDataSuccess()
//            }
//        })
//    }
//    
//    func getEventsCount() -> Int {
//        return events.count
//    }
//    
//    func setUpcomingEvents(){
//        print("setUpcomingEvents")
//    }
//    
//    func setLatestResults(){
//        print("setLatestResults like function")
//    }
//    
////    func configure(cell: LatestResultsCollectionViewCell, for index: Int) {
////        let latestResult = latestResults[index]
////        cell.displayHomeTeam(strHomeTeam: latestResult.strHomeTeam ?? "")
////        cell.displayAwayTeam(strAwayTeam: latestResult.strAwayTeam ?? "")
////    }
//    
//}
