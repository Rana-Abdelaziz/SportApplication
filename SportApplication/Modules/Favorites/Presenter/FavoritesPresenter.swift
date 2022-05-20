//
//  FavoritesPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation


protocol FavoritesView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol FavoritesCellView {
    func displayLeagueName(strSportThumb: String)
    func displayImage(strSportThumb: String)
}

class FavoritesPresenter {
    
    private weak var view: FavoritesView?
//    private let interactor = UpcomingEventsInteractor(baseUrl: Constants.BASE_URL)
    private var favorites = [League]()
    let coreData = CoreDataServices.shared
    
    init(view: FavoritesView) {
        self.view = view
    }
    
    func fetchAllLeagues(){
        print("fav leagues called")
        favorites = coreData.fetchAllLeagues()
        self.view?.fetchingDataSuccess()
    }
    
    
//    func getFavorites(leagueId: String){
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
//
    func getFavLeaguesCount() -> Int {
        print("fav leagus count inside presenter: \(favorites.count)")
        return favorites.count
    }
    
    func configure(cell: FavoritesTableViewCell, for index: Int) {
        let league = favorites[index]
        cell.displayLeagueName(leagueName: league.leagueName ?? "")
        cell.displayLeagueImage(leagueImage: league.leagueBadge ?? "")
    }
    
}

